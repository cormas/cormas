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
CMGitBridgeTest >> gitBridge [
	^ resourceLocator
]

{ #category : #accessing }
CMGitBridgeTest >> resourceBuilder [

	^ CMModelResource current
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

	^ self resourceBuilder assetsPath 
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
]

{ #category : #accessing }
CMGitBridgeTest >> tempFileFor: aName suffix: aSuffixString [

	^ (FileLocator temp asFileReference
		/ (FileReference newTempFilePrefix: aName suffix: aSuffixString) basename)
		fullName
]

{ #category : #testing }
CMGitBridgeTest >> testAnimationsPath [

	| file |
	file := self gitBridge animationsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory 
]

{ #category : #testing }
CMGitBridgeTest >> testAssetNamed [

	self assert: ((self gitBridge assetNamed: 'simpleMap.csv') isKindOf: FileReference)
]

{ #category : #testing }
CMGitBridgeTest >> testAssetsFilesDirectoryName [

	self assert: (self gitBridge assetsFilesDirectoryName isKindOf: String).
	self deny: self gitBridge assetsFilesDirectoryName isEmpty 
]

{ #category : #testing }
CMGitBridgeTest >> testAssetsPath [

	self assert: (self gitBridge assetsPath isKindOf: FileReference).
	self assert: self gitBridge assetsPath isDirectory.
]

{ #category : #testing }
CMGitBridgeTest >> testCormasPath [
	self assert: (self gitBridge cormasPath isKindOf: FileReference)
]

{ #category : #testing }
CMGitBridgeTest >> testDiagramsPath [

	| file |
	
	file := self gitBridge diagramsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/diagrams')
]

{ #category : #testing }
CMGitBridgeTest >> testDocPath [

	| file |
	
	file := self gitBridge docPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/doc')
]

{ #category : #testing }
CMGitBridgeTest >> testDumpPath [
	| file |
	file := self gitBridge dumpPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/dumps')
]

{ #category : #testing }
CMGitBridgeTest >> testImagesPath [

	| file |
	
	file := self gitBridge imagesPath: self sampleModelName.
	self assert: (file isKindOf: FileReference).
	self assert: file isDirectory.
	self assert: (file fullName endsWith: '/assets/models/MockModel/images')
]

{ #category : #testing }
CMGitBridgeTest >> testInputsPath [
	| file |
	file := self gitBridge inputsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/inputs')
]

{ #category : #testing }
CMGitBridgeTest >> testMapsPath [

	| file |
	
	file := self gitBridge mapsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/maps')
]

{ #category : #testing }
CMGitBridgeTest >> testModelNames [

	self assert: (self gitBridge modelNames isKindOf: Collection).
	self deny: self gitBridge modelNames isEmpty.
	self assert: (self gitBridge modelNames anyOne isKindOf: String)

]

{ #category : #testing }
CMGitBridgeTest >> testModelPath [

	| file |
	file := self gitBridge modelPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: (file fullName endsWith: '/assets/models/MockModel')
]

{ #category : #testing }
CMGitBridgeTest >> testModelsPath [

	self 
		assert: (self gitBridge modelsPath isKindOf: FileReference);
		assert: (self gitBridge modelsPath fullName endsWith: '/assets/models')
]

{ #category : #testing }
CMGitBridgeTest >> testOldVersionsPath [

	| file |
	
	file := self gitBridge oldVersionsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/old_versions')
]

{ #category : #testing }
CMGitBridgeTest >> testOutputsPath [
	| file |
	file := self gitBridge outputsPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/outputs')
]

{ #category : #testing }
CMGitBridgeTest >> testReadCsvFileMyModel [

	| matrix |
	
	matrix := self gitBridge 
		readCsvFile: self sampleMatrixFile 
		myModel: self sampleModelName.
	self assert: (matrix isKindOf: Collection).
	self deny: matrix isEmpty.
	self assert: (matrix allSatisfy: [ : subCol | subCol isKindOf: Collection ]).

]

{ #category : #testing }
CMGitBridgeTest >> testReadMatrixSep [

	| matrix |
	
	matrix := self gitBridge readMatrix: self sampleMatrixFile sep: $;.
	self assert: (matrix isKindOf: Collection).
	self assert: (matrix anyOne isKindOf: Collection).
	self assert: matrix size equals: 10.
	self assert: (matrix allSatisfy: [ : arr | arr size = 3 ]).
	
]

{ #category : #test }
CMGitBridgeTest >> testResourceDirectoryNames [

	self assert: (CMGitBridge resourceDirectoryNames isKindOf: Collection).
	self deny: CMGitBridge resourceDirectoryNames isEmpty.
	self assert: (CMGitBridge resourceDirectoryNames allSatisfy: [ : rdn | rdn isKindOf: String ])

]

{ #category : #testing }
CMGitBridgeTest >> testVideoPath [
	| file |
	file := self gitBridge videoPath: self sampleModelName.
	self
		assert: (file isKindOf: FileReference);
		assert: file isDirectory;
		assert: (file fullName endsWith: '/assets/models/MockModel/video')
]

{ #category : #testing }
CMGitBridgeTest >> testWorkingDirectory [

	self assert: (self gitBridge workingDirectory isKindOf: String) 
]
