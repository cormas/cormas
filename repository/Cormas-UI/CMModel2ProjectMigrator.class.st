"
A project is a standard way of working in many applications and could contain multiple models, hold meta-data and even resources such as images/audio/video without the need to be compiled in a .st class method, and be versioned in a standard fashion.

Use this class to create a CORMAS project file after migrated your model classes to Pharo.

Public API and Key Messages

See examples in class side or execute the following expression to generate a set of files matching your currently loaded CORMAS models in the image:

CMModel2ProjectMigrator new buildProjects.

"
Class {
	#name : #CMModel2ProjectMigrator,
	#superclass : #CMObject,
	#instVars : [
		'currentModel',
		'outputDirectory',
		'destinationPath'
	],
	#category : #'Cormas-UI-Project'
}

{ #category : #examples }
CMModel2ProjectMigrator class >> migrateModels [ 
	<example>
	
	Cursor wait showWhile: [ 
		self new 
			destinationPath: CMResourceLocator demosPath;
			buildProjects;
			moveProjects ]
]

{ #category : #building }
CMModel2ProjectMigrator >> buildForModel: aCMProjectModel [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	self buildForModelClass: aCMProjectModel cormasModelClass
]

{ #category : #building }
CMModel2ProjectMigrator >> buildForModelClass: modelClass [
	" Creates a CORMAS project file, answer a <FileReference> to the new created project "

	currentModel := CMProjectModel basicNew
		initializeForModel: modelClass named: modelClass friendlyName;
		yourself.
	self 
		writeDirectoryStructure;
		writeMetadata;
		writeSourceCode: modelClass

]

{ #category : #building }
CMModel2ProjectMigrator >> buildProjectFile [
	" Creates a CORMAS project file in the receiver's path. Assume the directory structure is already created and populated in outputDirectory "
	
	CMProjectFile 
		archiveAllFromPharo: self outputDirectory asFileReference children
		as: self currentModel projectFilename

]

{ #category : #building }
CMModel2ProjectMigrator >> buildProjectMetadataSTON [
	" Answer a <String> with project meta-data information in STON format "

	| cmModelClass cmMetadata |
	
	cmModelClass := self currentModel cormasModel.
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

{ #category : #building }
CMModel2ProjectMigrator >> buildProjects [
	" Main entry point for generating project files. Generate all project files from the models in this image "
	" Hopefully this method should be run only once, and to reformat project directory structure for example "

	'Model2Project: Building project files...' traceCr.
	CMAbstractModel subclassesDo: [ :modelClass |
			self buildForModelClass: modelClass.
			self buildProjectFile ].
	'Model2Project: Done building project files...' traceCr.
]

{ #category : #accessing }
CMModel2ProjectMigrator >> currentModel [
	^ currentModel
]

{ #category : #accessing }
CMModel2ProjectMigrator >> currentModel: anObject [
	currentModel := anObject
]

{ #category : #defaults }
CMModel2ProjectMigrator >> defaultDestinationPath [
	" Private - By default the destination path it is the user projects directory "
	
	^ CMResourceLocator userProjectsPath
]

{ #category : #defaults }
CMModel2ProjectMigrator >> defaultOutputDirectory [
	" Private - Answer the default <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ (self tempLocation / 'cormas_project') fullName
]

{ #category : #private }
CMModel2ProjectMigrator >> destinationPath [
	" Answer a <FileReference> with the destination where projects should be migrated/written "

	^ destinationPath
		ifNil: [ destinationPath := self defaultDestinationPath ]
]

{ #category : #accessing }
CMModel2ProjectMigrator >> destinationPath: anObject [
	destinationPath := anObject
]

{ #category : #writing }
CMModel2ProjectMigrator >> handleFileEx: ex [ 

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

{ #category : #defaults }
CMModel2ProjectMigrator >> metadataFilename [
	" Answer a <String> with the name of the file which stores metadata information about a project "

	^ CMProjectFile metadataFilename 
]

{ #category : #private }
CMModel2ProjectMigrator >> moveProject: aFileReference [ 
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
CMModel2ProjectMigrator >> moveProjectFile [
	" Private - Move aFileReference to the system demos/ path "
	
	self moveProject: FileSystem workingDirectory / self currentModel fileName
]

{ #category : #building }
CMModel2ProjectMigrator >> moveProjects [
	" Move recently generated projects to base location "

	'Model2Project: Moving project files...' traceCr.
	CMApplicationProject createUserDirectories.
	(self tempLocation allChildrenMatching: '*Model.zip') do: [ : modelRef |
		self moveProject: modelRef ].
	'Model2Project: Done moving project files...' traceCr.
]

{ #category : #building }
CMModel2ProjectMigrator >> osSystemInformation [
	" Answer a <String> with the OS system information of this host "

	^ String streamContents: [ : stream |
		stream
			nextPutAll: Smalltalk os platformName; space;
			nextPutAll: Smalltalk os version; space;
			nextPutAll: Smalltalk os subtype ]
]

{ #category : #accessing }
CMModel2ProjectMigrator >> outputDirectory [
	" Answer a <String> with the name of the directory serving as temporary location where to write project files before being compressed "
	
	^ outputDirectory
		ifNil: [ outputDirectory := self defaultOutputDirectory ]
]

{ #category : #defaults }
CMModel2ProjectMigrator >> resourceDirectoryNames [
	" Answer a <Collection> with the names of subdirectories of a CORMAS project "

	^ #(
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

{ #category : #defaults }
CMModel2ProjectMigrator >> tempLocation [

	^ FileLocator imageDirectory
]

{ #category : #writing }
CMModel2ProjectMigrator >> writeDirectoryStructure [
	" Private - Write directory names for the receiver's target project "

	| outDirRef |
	
	(outDirRef := self defaultOutputDirectory asFileReference) exists
		ifTrue: [ outDirRef deleteAll ].
	self resourceDirectoryNames do: [ : dirName | (outDirRef / dirName) ensureCreateDirectory ].

]

{ #category : #writing }
CMModel2ProjectMigrator >> writeMetadata [
	" Private - Write receiver's model metadata in a file "
	
	self outputDirectory asFileReference / self metadataFilename  
		writeStreamDo: [ :outputStream | outputStream << self buildProjectMetadataSTON ].

]

{ #category : #writing }
CMModel2ProjectMigrator >> writeSourceCode: modelClass [
	" Private - Create and store a file in Smalltalk Chunk format with modelClass source code "

	| newFile |

	self traceCrTab: 'Model2Project: Writing source code ' , modelClass asString. 
	modelClass package 
		fileOutOn: (WriteStream on: (String new: 4000))
		named: CMProjectFile sourceCodeFilename.
	newFile := self tempLocation / (CMProjectFile sourceCodeFilename , '.st').
	self writeSourceCodeInTempLocation: newFile.
	self traceCrTab: 'Model2Project: Done writing source code ' , modelClass asString. 
]

{ #category : #writing }
CMModel2ProjectMigrator >> writeSourceCodeInTempLocation: newFile [

	| dest |
	
	dest := self defaultOutputDirectory asFileReference / newFile basename.
	[ newFile asFileReference copyTo: dest ]
	on: FileExists, FileDoesNotExistException
	do: [ : ex | self handleFileEx: ex ].
	dest exists
		ifFalse: [ self error: 'CORMAS source code file was not copied into project directory' ].
	newFile asFileReference ensureDelete.
]
