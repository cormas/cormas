"
A project is a standard way of working in many applications and could contain multiple models, hold meta-data and even resources such as images/audio/video without the need to be compiled in a .st class method, and be versioned in a standard fashion.

Use this class to create a CORMAS project file after migrated your model classes to Pharo.

Public API and Key Messages

See examples in class side or execute the following expression to generate a set of files matching your currently loaded CORMAS models in the image:

CMModel2ProjectMigrator new buildProjects.

"
Class {
	#name : #CMProjectBuilder,
	#superclass : #CMObject,
	#instVars : [
		'outputDirectory',
		'destinationPath',
		'cormasModel'
	],
	#category : #'Cormas-Core-Project'
}

{ #category : #examples }
CMProjectBuilder class >> buildProjectModels [ 
	<script>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMResourceLocator demosPath;
			buildProjects;
			moveProjects;
			unloadPackages ]
]

{ #category : #examples }
CMProjectBuilder class >> rebuildModels [ 
	" Removes all existing demos and rebuild the project files from the code in the current image "
	<script>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMResourceLocator demosPath;
			rebuildProjects;
			moveProjects ]
]

{ #category : #defaults }
CMProjectBuilder class >> resourceDirectoryNames [
	" Answer a <Collection> with the names of subdirectories of a CORMAS project "

	^ #(
		'animations'
		'diagrams' 
		'doc' 
		'dumps' 
		'images'
		'inputs'
		'maps'
		'old_versions'
		'outputs'
		'video'
		)
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildForModel: aCMProjectModel [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	self buildForModelClass: aCMProjectModel cormasModelClass
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildForModelClass: modelClass [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	cormasModel := CMProjectModel basicNew
		initializeForModel: modelClass named: modelClass friendlyName;
		yourself.
	self 
		writeDirectoryStructure;
		writeMetadata;
		writeSourceCode: modelClass

]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildForModelInstance: modelInstance [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	cormasModel := CMProjectModel basicNew
		initializeForModel: modelInstance named: modelInstance friendlyName;
		yourself.
	self 
		writeDirectoryStructure;
		writeMetadata;
		writeSourceCode: modelInstance class

]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProjectFile [
	" Creates a CORMAS project file in the receiver's path. Assume the directory structure is already created and populated in outputDirectory "
	
	self buildProjectResources.
	CMProjectFile 
		archiveAllFromPharo: self outputDirectory asFileReference children
		as: self cormasModel projectFilename

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

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProjectResources [
	" Private - Locate the current model resources and copy them into the output directory to be archived "
	
	(self resourceLocator mapsPath: self cormasModel friendlyName) hasFiles
		ifTrue: [ self halt. ]
]

{ #category : #'accessing - building' }
CMProjectBuilder >> buildProjects [
	" Main entry point for generating project files. Generate all project files from the models in this image "
	" Hopefully this method should be run only once, and to reformat project directory structure for example "

	'Model2Project: Building project files...' traceCr.
	self loadModelPackages.
	CMAbstractModel subclassesDo: [ :modelClass |
			self buildForModelInstance: modelClass new.
			self buildProjectFile ].
	'Model2Project: Done building project files...' traceCr.
]

{ #category : #accessing }
CMProjectBuilder >> cormasModel [
	^ cormasModel
]

{ #category : #accessing }
CMProjectBuilder >> cormasModel: anObject [
	cormasModel := anObject
]

{ #category : #testing }
CMProjectBuilder >> cormasRepository [
	" Answer the receiver's CORMAS Iceberg repository  "

	^ IceLibgitRepository registry detect: [ : repo | repo name = 'cormas' ]
]

{ #category : #defaults }
CMProjectBuilder >> defaultDestinationPath [
	" Private - By default the destination path it is the user projects directory "
	
	^ CMResourceLocator userProjectsPath
]

{ #category : #defaults }
CMProjectBuilder >> defaultOutputDirectory [
	" Private - Answer the default <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ (self tempLocation / 'cormas_project') fullName
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
			self traceCrTab: 'Model2Project: Deleting existing project ' , ex fullName. 
			ex ensureDelete.
			self traceCrTab: 'Model2Project: Done deleting existing project ' , ex fullName. 
			ex retry ]
		ifFalse: [ 
			(ex isKindOf: FileDoesNotExistException)
				ifTrue: [ 
					self traceCrTab: 'Model2Project: Creating projects directory' , self defaultOutputDirectory. 
					self defaultOutputDirectory asFileReference ensureCreateDirectory.
					self traceCrTab: 'Model2Project: Done creating projects directory' , self defaultOutputDirectory.
					ex retry ] ]
]

{ #category : #testing }
CMProjectBuilder >> hasAllModelsLoaded [
	" Answer <true> if aPackageName <String> is loaded into the receiver's image "
	
	^ self modelPackageNames allSatisfy: [ : cmPackageName | self isModelLoaded: cmPackageName ]
]

{ #category : #testing }
CMProjectBuilder >> isModelLoaded: aPackageName [
	" Answer <true> if aPackageName <String> is loaded into the receiver's image "
	
	^ (IcePackage 
		named: aPackageName 
		repository: self cormasRepository) isLoaded.
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

	self modelPackageNames 
		do: [ : cmPkgName | self loadModelPackage: cmPkgName ]
		displayingProgress: 'Loading model packages'
]

{ #category : #defaults }
CMProjectBuilder >> metadataFilename [
	" Answer a <String> with the name of the file which stores metadata information about a project "

	^ CMProjectFile metadataFilename 
]

{ #category : #accessing }
CMProjectBuilder >> modelPackageNames [
	" Answer a <Collection> of <String> with CORMAS model package names "
	
	^ #(
	'Cormas-Model-ECEC'
	'Cormas-Model-Conway'
	'Cormas-Model-DemoAggregates'
	'Cormas-Model-Diffuse'
	'Cormas-Model-FireAutomata'
	'Cormas-Model-PlotsRental'
	'Cormas-Model-ReHab'
	'Cormas-Model-Stupid'
	)
]

{ #category : #private }
CMProjectBuilder >> moveProject: aFileReference [ 
	" Private - Move aFileReference to the system demos/ path "
	
	[	
		self traceCrTab: 'Model2Project: Moving project file...' , aFileReference fullName. 
		aFileReference moveTo: self destinationPath.
		self traceCrTab: 'Model2Project: Done moving project file...' , aFileReference fullName. 
	]
	on: FileExists
	do: [ : ex | 
		self traceCrTab: 'Model2Project: Deleting project file ' , ex fullName. 
		ex ensureDelete.
		ex retry. ]
]

{ #category : #private }
CMProjectBuilder >> moveProjectFile [
	" Private - Move aFileReference to the system demos/ path "
	
	self moveProject: FileSystem workingDirectory / self cormasModel fileName
]

{ #category : #'accessing - building' }
CMProjectBuilder >> moveProjects [
	" Move recently generated projects to base location "

	'Model2Project: Moving project files...' traceCr.
	CMApplicationProject createUserDirectories.
	(self tempLocation allChildrenMatching: '*Model.zip') do: [ : modelRef |
		self moveProject: modelRef ].
	'Model2Project: Done moving project files...' traceCr.
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

{ #category : #accessing }
CMProjectBuilder >> outputDirectory [
	" Answer a <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ outputDirectory
		ifNil: [ outputDirectory := self defaultOutputDirectory ]
]

{ #category : #'accessing - building' }
CMProjectBuilder >> rebuildProjects [
	" Rebuild project files. Remove and generate all project files from the models in this image "

	'Model2Project: Rebuilding project files...' traceCr.
	CMResourceLocator demosPath ensureDeleteAllChildren.
	CMAbstractModel subclassesDo: [ :modelClass |
			self buildForModelInstance: modelClass new.
			self buildProjectFile ].
	'Model2Project: Done rebuilding project files...' traceCr.
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

	| cormasRepo icePackage |

	cormasRepo := IceLibgitRepository registry detect: [ : repo | repo name = 'cormas' ].
	icePackage := IcePackage named: aPackageName repository: cormasRepo.
	IceTipStandardAction new 
		repository: cormasRepo;
		message: ('Unloading package {1}' format: { icePackage name });
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer
				suspendAllForRepository: cormasRepo
				while: [ icePackage unload ] ]
]

{ #category : #'accessing - unloading' }
CMProjectBuilder >> unLoadModelPackages [
	" Private - Unload packages which are CORMAS models from the image "

	self modelPackageNames 
		do: [ : cmPkgName | self unLoadModelPackage: cmPkgName ]
		displayingProgress: 'Unloading models from the image'
]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeDirectoryStructure [
	" Private - Write directory names for the receiver's target project "

	| outDirRef |
	
	(outDirRef := self defaultOutputDirectory asFileReference) exists
		ifTrue: [ outDirRef deleteAll ].
	self resourceDirectoryNames do: [ : dirName | (outDirRef / dirName) ensureCreateDirectory ].

]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeMetadata [
	" Private - Write receiver's model metadata in a file "
	
	self outputDirectory asFileReference / self metadataFilename  
		writeStreamDo: [ :outputStream | outputStream << self buildProjectMetadataSTON ].

]

{ #category : #'accessing - writing' }
CMProjectBuilder >> writeSourceCode: modelClass [
	" Private - Create and store a file in Smalltalk Chunk format with modelClass source code "

	| newFile |

	self traceCrTab: 'Model2Project: Writing source code ' , modelClass asString. 
	modelClass package 
		fileOutOn: (WriteStream on: (String new: 4000))
		named: CMProjectFile sourceCodeFilename.
	newFile := self tempLocation / CMProjectFile sourceCodeFilenameWithExtension.
	self writeSourceCodeInTempLocation: newFile.
	self traceCrTab: 'Model2Project: Done writing source code ' , modelClass asString. 
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
