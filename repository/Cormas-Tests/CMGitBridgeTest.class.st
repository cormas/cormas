Class {
	#name : #CMGitBridgeTest,
	#superclass : #TestCase,
	#instVars : [
		'resourceLocator',
		'resourceBuilder'
	],
	#category : #'Cormas-Tests-Helpers'
}

{ #category : #accessing }
CMGitBridgeTest class >> resources [

	^ Array with: CMModelResource.
]

{ #category : #accessing }
CMGitBridgeTest >> resourceBuilder [

	^ CMModelResource current
]

{ #category : #accessing }
CMGitBridgeTest >> resourceLocator [
	^ resourceLocator
]

{ #category : #accessing }
CMGitBridgeTest >> resourceLocator: arg1 [
	resourceLocator := arg1
]

{ #category : #testing }
CMGitBridgeTest >> sampleMatrixContents [

	^ '1;2;10
2;0;0
3;3;4
4;3;8
5;2;2
6;3;5
7;3;10
8;3;5
9;2;2
10;3;5'
]

{ #category : #testing }
CMGitBridgeTest >> sampleMatrixFile [

	| tempFilename |
	
	tempFilename := self tempFileFor: 'sampleMatrix' suffix: '.csv'.
	tempFilename asFileReference writeStreamDo: [ : stream | stream nextPutAll: self sampleMatrixContents ].
	^ tempFilename
]

{ #category : #accessing }
CMGitBridgeTest >> sampleModel [

	^ self resourceBuilder modelPath 
]

{ #category : #accessing }
CMGitBridgeTest >> sampleModelName [
	" Answer a <String> with the name of the mock model used for testing "

	^ self resourceBuilder sampleModelName 
]

{ #category : #running }
CMGitBridgeTest >> setUp [

	super setUp.
	self resourceLocator: CMGitBridge new.
	self resourceLocator class useGitBridge: false.
]

{ #category : #accessing }
CMGitBridgeTest >> tempFileFor: aName suffix: aSuffixString [

	^ (FileLocator temp asFileReference
		/ (FileReference newTempFilePrefix: aName suffix: aSuffixString) basename)
		fullName
]

{ #category : #testing }
CMGitBridgeTest >> testAnimationsPath [
	| cmFileRef |
	cmFileRef := self resourceLocator animationsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory 
]

{ #category : #testing }
CMGitBridgeTest >> testAssetNamed [

	self assert: ((self resourceLocator assetNamed: 'simpleMap.csv') isKindOf: FileReference)
]

{ #category : #testing }
CMGitBridgeTest >> testAssetsFilesDirectoryName [

	self assert: (self resourceLocator assetsFilesDirectoryName isKindOf: String).
	self deny: self resourceLocator assetsFilesDirectoryName isEmpty 
]

{ #category : #testing }
CMGitBridgeTest >> testAssetsPath [

	self assert: (self resourceLocator assetsPath isKindOf: FileReference).
	self assert: self resourceLocator assetsPath isDirectory.
]

{ #category : #testing }
CMGitBridgeTest >> testCormasPath [
	self assert: (self resourceLocator cormasPath isKindOf: FileReference)
]

{ #category : #testing }
CMGitBridgeTest >> testDiagramsPath [

	| cmFileRef |
	
	cmFileRef := self resourceLocator diagramsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/diagrams'
]

{ #category : #testing }
CMGitBridgeTest >> testDocPath [

	| cmFileRef |
	
	cmFileRef := self resourceLocator docPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/doc'
]

{ #category : #testing }
CMGitBridgeTest >> testDumpPath [
	| cmFileRef |
	cmFileRef := self resourceLocator dumpPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/dumps'
]

{ #category : #testing }
CMGitBridgeTest >> testImagesPath [

	| cmFileRef |
	
	cmFileRef := self resourceLocator imagesPath: self sampleModelName.
	self assert: (cmFileRef isKindOf: FileReference).
	self assert: cmFileRef isDirectory.
	self assert: cmFileRef fullName equals: '/assets/models/MockModel/images'
]

{ #category : #testing }
CMGitBridgeTest >> testInputsPath [
	| cmFileRef |
	cmFileRef := self resourceLocator inputsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/inputs'
]

{ #category : #testing }
CMGitBridgeTest >> testMapsPath [

	| cmFileRef |
	
	cmFileRef := self resourceLocator mapsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/maps'
]

{ #category : #testing }
CMGitBridgeTest >> testModelNames [

	self assert: (self resourceLocator modelNames isKindOf: Collection).
	self deny: self resourceLocator modelNames isEmpty.
	self assert: (self resourceLocator modelNames anyOne isKindOf: String)

]

{ #category : #testing }
CMGitBridgeTest >> testModelPath [

	| cmFileRef |
	cmFileRef := self resourceLocator modelPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef fullName equals: '/assets/models/MockModel'
]

{ #category : #testing }
CMGitBridgeTest >> testModelsPath [

	self 
		assert: (self resourceLocator modelsPath isKindOf: FileReference);
		assert: self resourceLocator modelsPath fullName equals: '/assets/models'
]

{ #category : #testing }
CMGitBridgeTest >> testOldVersionsPath [

	| cmFileRef |
	
	cmFileRef := self resourceLocator oldVersionsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/old_versions'
]

{ #category : #testing }
CMGitBridgeTest >> testOutputsPath [
	| cmFileRef |
	cmFileRef := self resourceLocator outputsPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/outputs'
]

{ #category : #testing }
CMGitBridgeTest >> testReadCsvFileMyModel [

	| matrix |
	
	matrix := self resourceLocator 
		readCsvFile: self sampleMatrixFile 
		myModel: self sampleModelName.
	self assert: (matrix isKindOf: Collection).
	self deny: matrix isEmpty.
	self assert: (matrix allSatisfy: [ : subCol | subCol isKindOf: Collection ]).

]

{ #category : #testing }
CMGitBridgeTest >> testReadMatrixSep [

	| matrix |
	
	matrix := self resourceLocator readMatrix: self sampleMatrixFile sep: $;.
	self assert: (matrix isKindOf: Collection).
	self assert: (matrix anyOne isKindOf: Collection).
	self assert: matrix size equals: 10.
	self assert: (matrix allSatisfy: [ : arr | arr size = 3 ]).
	
]

{ #category : #testing }
CMGitBridgeTest >> testVideoPath [
	| cmFileRef |
	cmFileRef := self resourceLocator videoPath: self sampleModelName.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory;
		assert: cmFileRef fullName equals: '/assets/models/MockModel/video'
]

{ #category : #testing }
CMGitBridgeTest >> testWorkingDirectory [

	self assert: (self resourceLocator workingDirectory isKindOf: String) 
]
