"
A project is a standard way of working in many applications and could contain multiple models, hold meta-data and even resources such as images/audio/video without the need to be compiled in a .st class method, and be versioned in a standard fashion.

Use this class:

- If you want to save a resource file into your project (this first requires you place the file in one of the subdirectories in the 'cormas_project' subdirectory located under your current image working directory).
- To create a CORMAS project file after migrated your model classes to Pharo.

Public API and Key Messages

See examples in class side or execute the following expression to generate a set of files matching your currently loaded CORMAS models in the image:

CMProjectBuilder new buildProjects.

"
Class {
	#name : #CMProjectBuilder,
	#superclass : #CMObject,
	#instVars : [
		'destinationPath',
		'cormasModel',
		'cormasProject',
		'localBuildDir',
		'builtFileRef'
	],
	#category : #'Cormas-Core-Project'
}

{ #category : #examples }
CMProjectBuilder class >> buildProjectDemos [
	" Removes all existing demos and rebuild the project files from the code in the current image.
	All the models source code should be loaded into the image "

	<script>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMGitBridge demosPath;
			buildDemoProjects;
			moveProjects;
			unLoadModelPackages ].
	self inform: 'CORMAS Project Builder: Models built'
]

{ #category : #examples }
CMProjectBuilder class >> buildProjectNamed: aPackageName modelClass: aModelClass [
	" Store into demos path a new CORMAS project named aPackageName <String> representing aModelClass <CMAbstractModel>. aModelClass could be a <Class> or a <Symbol> for convenience "
	<script>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMGitBridge demosPath;
			buildProject: aPackageName modelClass: aModelClass;
			moveProject;
			unLoadModelPackage: aPackageName;
			cleanLocalBuildDir ]
]

{ #category : #accessing }
CMProjectBuilder class >> modelPackageNames [
	" Answer a <Collection> of <String> with CORMAS model package names "
	
	^ #(
	)
]

{ #category : #examples }
CMProjectBuilder class >> outputDirName [

	^ 'cormas_project'
]

{ #category : #examples }
CMProjectBuilder class >> rebuildModels [ 
	" Removes all existing demos and rebuild the project files from the code in the current image.
	All the models source code should be loaded into the image "
	<script>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMGitBridge demosPath;
			rebuildProjects;
			moveProjects ].
	self inform: 'CORMAS Project Builder: Models built'
]

{ #category : #defaults }
CMProjectBuilder class >> resourceDirectoryNames [
	" Answer a <Collection> with the names of subdirectories of a CORMAS project "

	^ CMGitBridge resourceDirectoryNames
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildDemoProjects [
	" Rebuild demo project files. Iceberg packages should be already loaded in this image. 
	Remove and generate all project files using the model class found for each demo package. "

	'CORMAS Project Builder: Rebuilding demo projects...' traceCr.
	self cleanDemosProjectDir.
	self loadModelPackages.	
	self modelPackageNames do: [ : modelPackageName |
		| modelClassName |
		modelClassName := modelPackageName asPackage classes detect: [ : c | c superclass = CMAbstractModel ].
		self buildProject: modelPackageName modelClass: modelClassName.
		self buildProjectFile ].
	'CORMAS Project Builder: Done rebuilding demo projects...' traceCr.
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildForModelInstance: modelInstance [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	cormasProject := CMProjectModel basicNew
		initializeForModel: modelInstance named: modelInstance friendlyName;
		yourself.
	self cormasModel: modelInstance.
	self 
		writeProjectTree;
		writeMetadata;
		writeSourceCode: modelInstance class

]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProject: aModelName modelClass: aModelClass [
	" Main entry point for generating project files. Generate all project files from the models in this image.
	Answer the <FileReference> of the built project "

	'CORMAS Project Builder: Building project...' traceCr.
	self loadModelPackage: aModelName.
	self buildForModelInstance: aModelClass new.
	'CORMAS Project Builder: Done building project...' traceCr.	
	builtFileRef := self buildProjectFile.
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProjectFile [
	" Creates a CORMAS project file in the receiver's path. Assume the directory structure is already created and populated in outputDirectory. Answer the <FileReference> of the built project "
	
	^ CMProjectFile 
		archiveAllFromPharo: self localBuildDirRef children
		as: self cormasProject projectFilename

]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProjectMetadataSTON [
	" Answer a <String> with project meta-data information in STON format "

	| cmModelClass cmMetadata |
	
	cmModelClass := self cormasModel class.
	cmMetadata := Dictionary new.
	cmMetadata 
		at: 'Name' put: cmModelClass friendlyName;
		at: 'Model class' put: cmModelClass name;
		at: 'Authors' put: cmModelClass cmAuthors;
		at: 'Version' put: cmModelClass cmVersion;
		at: 'Comments' put: cmModelClass cmComments;
		at: 'Valid'	put: cmModelClass cmValid;
		at: 'Owner' put: cmModelClass cmOwner;
		at: 'CORMAS version' put: cmModelClass cmMinimalVersion;
		at: 'Related projects' put: cmModelClass cmRelatedProjects;
		at: 'Demo' put: true;
		at: 'Language' put: 'English';
		at: 'Pharo version' put: SystemVersion current version;
		at: 'OS version' put: self osSystemInformation;
		at: 'CreationDate' put: DateAndTime now;
		at: 'Stars' put: 5.
	^ STON toStringPretty: cmMetadata

]

{ #category : #accessing }
CMProjectBuilder >> builtFileRef [

	^ builtFileRef
]

{ #category : #accessing }
CMProjectBuilder >> builtFileRef: anObject [

	builtFileRef := anObject
]

{ #category : #'accessing - cleaning' }
CMProjectBuilder >> cleanDemosProjectDir [

	CMGitBridge demosPath ensureDeleteAllChildren.
]

{ #category : #'accessing - cleaning' }
CMProjectBuilder >> cleanLocalBuildDir [
	" Answer a <FileReference> to the receiver's project local build directory "

	self localBuildDirRef ensureDeleteAll
]

{ #category : #accessing }
CMProjectBuilder >> cormasModel [
	" Answer an instance of <CMAbstractModel> associated to the receiver's project "

	^ cormasModel
]

{ #category : #accessing }
CMProjectBuilder >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #accessing }
CMProjectBuilder >> cormasProject [

	^ cormasProject
]

{ #category : #accessing }
CMProjectBuilder >> cormasProject: anObject [

	cormasProject := anObject
]

{ #category : #'accessing - unloading' }
CMProjectBuilder >> cormasRepository [
	" Answer the receiver's CORMAS Iceberg repository  "

	^ CMApplicationProject cormasRepository
]

{ #category : #defaults }
CMProjectBuilder >> defaultDestinationPath [
	" Private - By default the destination path it is the user projects directory "
	
	^ CMGitBridge userProjectsPath
]

{ #category : #defaults }
CMProjectBuilder >> defaultOutputDirectory [
	" Private - Answer the default <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ (self tempLocation / self class outputDirName) fullName
]

{ #category : #private }
CMProjectBuilder >> destinationPath [
	" Answer a <FileReference> with the destination where projects should be migrated/written "

	^ destinationPath
		ifNil: [ destinationPath := self defaultDestinationPath ]
]

{ #category : #accessing }
CMProjectBuilder >> destinationPath: aFileReference [
	" Set the receiver's path where the destination files will be written "

	destinationPath := aFileReference
]

{ #category : #'accessing - writing' }
CMProjectBuilder >> handleFileEx: ex [ 

	(ex isKindOf: FileExists)
		ifTrue: [ 
			self traceCrTab: 'CORMAS Project Builder: Deleting existing project ' , ex fullName. 
			ex ensureDelete.
			self traceCrTab: 'CORMAS Project Builder: Done deleting existing project ' , ex fullName. 
			ex retry ]
		ifFalse: [ 
			(ex isKindOf: FileDoesNotExistException)
				ifTrue: [ 
					self traceCrTab: 'CORMAS Project Builder: Creating projects directory' , self defaultOutputDirectory. 
					self defaultOutputDirectory asFileReference ensureCreateDirectory.
					self traceCrTab: 'CORMAS Project Builder: Done creating projects directory' , self defaultOutputDirectory.
					ex retry ] ]
]

{ #category : #testing }
CMProjectBuilder >> hasAllModelsLoaded [
	" Answer <true> if aPackageName <String> is loaded into the receiver's image "
	
	^ self modelPackageNames allSatisfy: [ : cmPackageName | self isModelLoaded: cmPackageName ]
]

{ #category : #testing }
CMProjectBuilder >> hasLocalBuild [
	" Answer <true> if there is a path like /Users/<username>/<my_pharo_dir>/cormas_project which represents the path where projects are built "
	
	^ self localBuildDirRef exists
]

{ #category : #testing }
CMProjectBuilder >> isModelLoaded: aPackageName [
	" Answer <true> if aPackageName <String> is loaded into the receiver's image "
	
	^ (IcePackage 
		named: aPackageName 
		repository: self cormasRepository)
			ifNotNil: #isLoaded
			ifNil: [ false ]
]

{ #category : #'accessing - loading' }
CMProjectBuilder >> lazyLoadModelPackage: aPackageName [
	" Load aPackageName <String> CORMAS package only if is not already loaded in the image "
	
	(self isModelLoaded: aPackageName)
		ifFalse: [ self loadModelPackage: aPackageName ]
]

{ #category : #'accessing - loading' }
CMProjectBuilder >> lazyLoadModelPackages [
	" Private - Lazy load all defined packages which are CORMAS models "

	self modelPackageNames 
		do: [ : cmPkgName | self lazyLoadModelPackage: cmPkgName ]
		displayingProgress: 'Lazy loading model packages'
]

{ #category : #'accessing - loading' }
CMProjectBuilder >> loadModelPackage: aPackageName [
	" Load an Iceberg package named aPackageName <String> (for ex. 'Cormas-Model-ECEC' from the receiver's Iceberg repository location "
	| cormasRepo icePackage |

	cormasRepo := self cormasRepository.
	icePackage := IcePackage named: aPackageName repository: cormasRepo.
	IceTipStandardAction new 
		repository: cormasRepo;
		message: ('Loading package {1}' format: { icePackage name });
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer
				suspendAllForRepository: cormasRepo
				while: [ icePackage load ] ]
]

{ #category : #'accessing - loading' }
CMProjectBuilder >> loadModelPackages [
	" Private - Load all defined packages which are CORMAS models "

	EpMonitor disableDuring: [ 
		self modelPackageNames 
			do: [ : cmPkgName | self loadModelPackage: cmPkgName ]
			displayingProgress: [ : cmPkgName | 'Loading model package: ' , cmPkgName ] ]
]

{ #category : #accessing }
CMProjectBuilder >> localBuildDir [
	" Answer a <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ localBuildDir
		ifNil: [ localBuildDir := self defaultOutputDirectory ]
]

{ #category : #accessing }
CMProjectBuilder >> localBuildDirRef [
	" Answer a <FileReference> to the receiver's project local build directory "

	^ self localBuildDir asFileReference 
]

{ #category : #defaults }
CMProjectBuilder >> metadataFilename [
	" Answer a <String> with the name of the file which stores metadata information about a project "

	^ CMProjectFile metadataFilename 
]

{ #category : #accessing }
CMProjectBuilder >> modelPackageNames [
	" Answer a <Collection> of <String> with CORMAS model package names "
	
	^ self class modelPackageNames
]

{ #category : #private }
CMProjectBuilder >> moveProject [ 
	" Private - Move the receiver's built <FileReference> to the system demos/ path "
	
	self moveProject: self builtFileRef
]

{ #category : #private }
CMProjectBuilder >> moveProject: aFileReference [
	" Private - Move aFileReference to the system demos/ path "
	
	[	
		self traceCrTab: 'CORMAS Project Builder: Moving project file...' , aFileReference fullName. 
		aFileReference moveTo: self destinationPath.
		self traceCrTab: 'CORMAS Project Builder: Done moving project file...' , aFileReference fullName. 
	]
	on: FileExists
	do: [ : ex | 
		self traceCrTab: 'CORMAS Project Builder: Deleting project file ' , ex fullName. 
		ex ensureDelete.
		ex retry. ]
]

{ #category : #private }
CMProjectBuilder >> moveProjectFile [
	" Private - Move aFileReference to the system demos/ path "
	
	self moveProject: FileSystem workingDirectory / self cormasProject fileName.
]

{ #category : #'accessing - building' }
CMProjectBuilder >> moveProjects [
	" Move recently generated projects to base location "

	'CORMAS Project Builder: Moving project files...' traceCr.
	CMApplicationProject createUserDirectories.
	(self tempLocation allChildrenMatching: '*Model.zip') do: [ : modelRef |
		self moveProject: modelRef ].
	'CORMAS Project Builder: Done moving project files...' traceCr.
]

{ #category : #accessing }
CMProjectBuilder >> osSystemInformation [
	" Answer a <String> with the OS system information of this host "

	^ String streamContents: [ : stream |
		stream
			nextPutAll: Smalltalk os platformName; space;
			nextPutAll: Smalltalk os version; space;
			nextPutAll: Smalltalk os subtype ]
]

{ #category : #'accessing - building' }
CMProjectBuilder >> rebuildProjects [
	" Rebuild demo project files. Iceberg packages should be already loaded in this image. 
	Remove and generate all project files using the model class found for each demo package. "

	'CORMAS Project Builder: Rebuilding projects...' traceCr.
	CMGitBridge demosPath ensureDeleteAllChildren.
	self modelPackageNames do: [ : modelPackageName |
		| modelClassName |
		modelClassName := modelPackageName asPackage classes detect: [ : c | c superclass = CMAbstractModel ].
		self buildProject: modelPackageName modelClass: modelClassName.
		self buildProjectFile ].
	'CORMAS Project Builder: Done rebuilding projects...' traceCr.
]

{ #category : #defaults }
CMProjectBuilder >> resourceDirectoryNames [
	" Answer a <Collection> with the names of subdirectories of a CORMAS project "

	^ self class resourceDirectoryNames
]

{ #category : #defaults }
CMProjectBuilder >> tempLocation [

	^ FileLocator imageDirectory
]

{ #category : #'accessing - unloading' }
CMProjectBuilder >> unLoadModelPackage: aPackageName [

	self cormasRepository 
		ifNotNil: [ : cormasRepo |
			| icePackage |
			icePackage := IcePackage named: aPackageName repository: cormasRepo.
			IceTipStandardAction new 
				repository: cormasRepo;
				message: ('Unloading package {1}' format: { icePackage name });
				onSuccessRepositoryModified;
				execute: [ 
					Iceberg announcer
						suspendAllForRepository: cormasRepo
						while: [ icePackage unload ] ] ]
			ifNil: [ self inform: 'Cannot find CORMAS repository' ]
]

{ #category : #'accessing - unloading' }
CMProjectBuilder >> unLoadModelPackages [
	" Private - Unload packages which are CORMAS models from the image "

	EpMonitor disableDuring: [ 
		self modelPackageNames 
			do: [ : cmPkgName | self unLoadModelPackage: cmPkgName ]
			displayingProgress: [ : cmPkgName | 'Unloading model: ' , cmPkgName ] ]
]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeMetadata [
	" Private - Write receiver's model metadata in a file "
	
	[ 
		self localBuildDirRef / self metadataFilename  
			writeStreamDo: [ :outputStream | outputStream << self buildProjectMetadataSTON ] 
	]
	on: FileDoesNotExistException
	do: [ : ex | 
		(self localBuildDirRef / self metadataFilename) ensureCreateFile.
		ex retry ].

]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeProjectTree [
	" Private - Write directory structure for the receiver's target project. Resources (files) are taken from the local project's path. 
	If the project is named 'Lala' then this directory looks like  	/Users/<username>/git_projects/CORMAS_image_dir/pharo-local/iceberg/cormas/cormas/assets/models/Lala/animations "
	
	self hasLocalBuild 
		ifTrue: [ self localBuildDirRef deleteAll ].
	self localBuildDirRef ensureCreateDirectory.
	CMGitBridge resourceSelectors
		do: [ :resSelector | self writeProjectTree: resSelector ]
		displayingProgress: [ :each | each ]

]

{ #category : #accessing }
CMProjectBuilder >> writeProjectTree: resSelector [
	" Private - Write all the resources (file tree) specified by resSelector found in the receiver's model local directory to aFileDirectory "
	| resLocator resTypeDir newResourceDir |
		
	resLocator := self cormasProject gitBridge.
	resTypeDir := resLocator 
		perform: resSelector asSymbol 
		with: self cormasModel class shortName.
	" Create the output directory for containing the resources "
	newResourceDir := (self localBuildDirRef / resTypeDir basename) ensureCreateDirectory.
	resTypeDir exists 
			ifTrue: [ 
				[ resTypeDir copyAllTo: newResourceDir ]
				on: FileExists
				do: [ : ex | 
					ex ensureDelete.
					ex retry.] ].

]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeSourceCode: modelClass [
	" Private - Create and store a file in Smalltalk Chunk format with modelClass source code "

	| newFile |

	self traceCrTab: 'CORMAS Project Builder: Writing source code ' , modelClass asString. 
	modelClass package 
		fileOutOn: (WriteStream on: (String new: 4000))
		named: CMProjectFile sourceCodeFilename.
	newFile := self tempLocation / CMProjectFile sourceCodeFilenameWithExtension.
	self writeSourceCodeInTempLocation: newFile.
	self traceCrTab: 'CORMAS Project Builder: Done writing source code ' , modelClass asString. 
]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeSourceCodeInTempLocation: newFile [

	| dest |
	
	dest := self defaultOutputDirectory asFileReference / newFile basename.
	[ newFile asFileReference copyTo: dest ]
	on: FileExists, FileDoesNotExistException
	do: [ : ex | self handleFileEx: ex ].
	dest exists
		ifFalse: [ self error: 'CORMAS source code file was not copied into project directory' ].
	newFile asFileReference ensureDelete.
]
