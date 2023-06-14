"
A CMModel2ProjectMigratorTest is a test class for testing the behavior of CMModel2ProjectMigrator
"
Class {
	#name : #CMProjectBuilderTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'builder',
		'sampleProject'
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
CMProjectBuilderTest >> createSampleProject [
	" Create a new sample CORMAS project in the Pharo image directory "

	self sampleProject: (self builder
		buildForModelInstance: CMMockModel new;
		yourself)
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

{ #category : #accessing }
CMProjectBuilderTest >> sampleProject [

	^ sampleProject
]

{ #category : #accessing }
CMProjectBuilderTest >> sampleProject: anObject [

	sampleProject := anObject
]

{ #category : #running }
CMProjectBuilderTest >> setUp [

	super setUp.
	self timeLimit: self defaultTimeLimit + 25 seconds.
	self builder: CMProjectBuilder new.
]

{ #category : #test }
CMProjectBuilderTest >> testCormasModel [

	self builder cormasModel: CMMockModel new.
	self assert: (self builder cormasModel isKindOf: CMMockModel).


]

{ #category : #test }
CMProjectBuilderTest >> testDefaultOutputDirectory [

	self assert: (self builder defaultOutputDirectory isKindOf: String) description: 'It should get the String directory where project files are written'.
	self deny: self builder defaultOutputDirectory isEmpty description: 'Default output directory should not be empty'.
]

{ #category : #test }
CMProjectBuilderTest >> testLocalBuildDir [

	self assert: (self builder localBuildDir isKindOf: String) description: 'Local build directory should be a String'.
	self deny: self builder localBuildDir isEmpty description: 'Local build directory should not be empty'.

]

{ #category : #test }
CMProjectBuilderTest >> testLocalBuildDirRef [

	self assert: (self builder localBuildDirRef isKindOf: FileReference) description: 'It should get the local build FileReference'.
	self assert: (self builder localBuildDirRef isDirectory) description: 'Local build location should be a directory'.

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
CMProjectBuilderTest >> testNonexistingModelIsNotLoaded [

	self deny: (self builder isModelLoaded: 'CMInvalidXYZ123Model')
]

{ #category : #test }
CMProjectBuilderTest >> testOutputDirectory [

	self assert: (self builder localBuildDir isKindOf: String).
	self deny: self builder localBuildDir isEmpty.

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
CMProjectBuilderTest >> testUnLoadModelPackages [

	self builder lazyLoadModelPackages.
	self assert: self builder hasAllModelsLoaded.
	self builder unLoadModelPackages.
	self deny: self builder hasAllModelsLoaded.
]

{ #category : #test }
CMProjectBuilderTest >> testWriteProjectTree [

	self createSampleProject.
	self builder cormasModel: self sampleProject cormasModel.
	self builder writeProjectTree.
	self 
		assertCollection: (self builder localBuildDirRef children collect: #basename) 
		hasSameElements: CMGitBridge resourceDirectoryNames
]
