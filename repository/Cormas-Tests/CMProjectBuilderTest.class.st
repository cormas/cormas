"
A CMModel2ProjectMigratorTest is a test class for testing the behavior of CMModel2ProjectMigrator
"
Class {
	#name : #CMProjectBuilderTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'builder'
	],
	#category : #'Cormas-Tests-Project'
}

{ #category : #accessing }
CMProjectBuilderTest >> builder [

	^ builder
]

{ #category : #accessing }
CMProjectBuilderTest >> builder: anObject [

	builder := anObject
]

{ #category : #test }
CMProjectBuilderTest >> expectedMetadata [

	| cmModelClass |
	cmModelClass := self model class.
	^ Dictionary new 
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
		at: 'OS version' put: self builder osSystemInformation;
		at: 'Stars' put: 5;
		yourself.
]

{ #category : #test }
CMProjectBuilderTest >> sampleModelClass [

	^ Smalltalk at: #CMECECModel
]

{ #category : #test }
CMProjectBuilderTest >> sampleModelName [

	^ 'Cormas-Model-ECEC'
	
]

{ #category : #running }
CMProjectBuilderTest >> setUp [

	super setUp.
	self timeLimit: self defaultTimeLimit + 25 seconds.
	self builder: CMProjectBuilder new.
	CMResourceLocator useGitBridge: false.
]

{ #category : #running }
CMProjectBuilderTest >> tearDown [

	super tearDown.
	self builder unLoadModelPackages.
	CMResourceLocator useGitBridge: true.
]

{ #category : #test }
CMProjectBuilderTest >> testBuildProjectMetadataSTON [

"	| expected |
	
	self builder cormasModel: self model.
	expected := STON toStringPretty: self expectedMetadata.
	self assert: self builder buildProjectMetadataSTON equals: expected."
]

{ #category : #test }
CMProjectBuilderTest >> testCormasModel [

	self builder cormasModel: CMMockModel new.
	self assert: (self builder cormasModel isKindOf: CMMockModel).


]

{ #category : #test }
CMProjectBuilderTest >> testDestinationPath [

	self flag: #toDo.
	"self assert: (self migrator destinationPath isKindOf: FileReference).
	self assert: self migrator destinationPath isDirectory."

]

{ #category : #test }
CMProjectBuilderTest >> testMetadataFilename [

	self assert: (self builder metadataFilename isKindOf: String).
	self deny: self builder metadataFilename isEmpty.
	self assert: (self builder metadataFilename endsWith: 'ston')
]

{ #category : #test }
CMProjectBuilderTest >> testModelPackageNames [

	self assert: (self builder modelPackageNames isKindOf: Collection).
	self deny: self builder modelPackageNames isEmpty.
	self assert: (self builder modelPackageNames allSatisfy: [ : pkgName | pkgName isKindOf: String ]).
	


]

{ #category : #test }
CMProjectBuilderTest >> testOutputDirectory [

	self assert: (self builder outputDirectory isKindOf: String).
	self deny: self builder outputDirectory isEmpty.

]

{ #category : #test }
CMProjectBuilderTest >> testResourceDirectoryNames [

	self assert: (self builder resourceDirectoryNames isKindOf: Collection).
	self deny: self builder resourceDirectoryNames isEmpty.
	self assert: (self builder resourceDirectoryNames allSatisfy: [ : rdn | rdn isKindOf: String ])

]

{ #category : #test }
CMProjectBuilderTest >> testTempLocation [

	self assert: (self builder tempLocation isKindOf: FileLocator).
	self assert: self builder tempLocation isDirectory.

]

{ #category : #test }
CMProjectBuilderTest >> testUnLoadModelPackage [

	| testPackageName |
	
	CMResourceLocator useGitBridge 
		ifFalse: [ ^ self ].
	testPackageName := self sampleModelName.
	self builder lazyLoadModelPackage: testPackageName.
	self assert: (self builder isModelLoaded: testPackageName).
	self builder unLoadModelPackage: testPackageName.
	self deny: (self builder isModelLoaded: testPackageName).
	
]

{ #category : #test }
CMProjectBuilderTest >> testUnLoadModelPackages [

	CMResourceLocator useGitBridge 
		ifFalse: [ ^ self ].
	self builder lazyLoadModelPackages.
	self assert: self builder hasAllModelsLoaded.
	self builder unLoadModelPackages.
	self deny: self builder hasAllModelsLoaded.
]

{ #category : #test }
CMProjectBuilderTest >> testWriteSourceCode [

	| newFileRef outputFileRef |
	
	CMResourceLocator useGitBridge 
		ifFalse: [ ^ self ].
	(self builder lazyLoadModelPackage: self sampleModelName).
	self builder writeSourceCode: self sampleModelClass.
	newFileRef := self builder tempLocation / CMProjectFile sourceCodeFilenameWithExtension.
	outputFileRef := self builder defaultOutputDirectory asFileReference / newFileRef basename.
	self assert: outputFileRef isFile.
	self assert: outputFileRef basename equals: CMProjectFile sourceCodeFilenameWithExtension.
	self deny: outputFileRef contents isEmpty.
	
]
