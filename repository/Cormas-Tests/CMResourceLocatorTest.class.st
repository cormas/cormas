Class {
	#name : #CMResourceLocatorTest,
	#superclass : #TestCase,
	#instVars : [
		'instance'
	],
	#category : #'Cormas-Tests-Helpers'
}

{ #category : #accessing }
CMResourceLocatorTest >> instance [
	^ instance
]

{ #category : #accessing }
CMResourceLocatorTest >> instance: arg1 [
	instance := arg1
]

{ #category : #accessing }
CMResourceLocatorTest >> sampleModel [
	^ 'ECEC'
]

{ #category : #testing }
CMResourceLocatorTest >> setUp [
	super setUp.
	self instance: CMResourceLocator new
]

{ #category : #testing }
CMResourceLocatorTest >> testAssetNamed [

	self assert: ((self instance assetNamed: 'simpleMap.csv') isKindOf: FileReference)
]

{ #category : #testing }
CMResourceLocatorTest >> testAssetsFilesDirectoryName [

	self assert: (self instance assetsFilesDirectoryName isKindOf: String).
	self deny: self instance assetsFilesDirectoryName isEmpty 
]

{ #category : #testing }
CMResourceLocatorTest >> testAssetsPath [

	self assert: (self instance assetsPath isKindOf: FileReference).
	self assert: self instance assetsPath isDirectory.
]

{ #category : #testing }
CMResourceLocatorTest >> testCormasPath [
	self assert: (self instance cormasPath isKindOf: FileReference)
]

{ #category : #testing }
CMResourceLocatorTest >> testDumpPath [
	| cmFileRef |
	cmFileRef := self instance dumpPath: self sampleModel.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory 
]

{ #category : #testing }
CMResourceLocatorTest >> testImagesPath [

	| cmFileRef |
	cmFileRef := self instance imagesPath.
	self assert: (cmFileRef isKindOf: FileReference).
]

{ #category : #testing }
CMResourceLocatorTest >> testModelNames [

	self assert: (self instance modelNames isKindOf: Collection).
	self deny: self instance modelNames isEmpty.
	self assert: (self instance modelNames anyOne isKindOf: String)

]

{ #category : #testing }
CMResourceLocatorTest >> testModelPath [

	| cmFileRef |
	cmFileRef := self instance modelPath: self sampleModel.
	self
		assert: (cmFileRef isKindOf: FileReference).
]

{ #category : #testing }
CMResourceLocatorTest >> testModelsPath [

	self assert: (self instance modelsPath isKindOf: FileReference).
]

{ #category : #testing }
CMResourceLocatorTest >> testReadCsvFileMyModel [

	| matrix |
	
	matrix := self instance readCsvFile: 'simpleMap' myModel: 'ECEC'.
	self assert: (matrix isKindOf: Collection).
	self deny: matrix isEmpty.
	self assert: (matrix allSatisfy: [ : subCol | subCol isKindOf: Collection ]).

]

{ #category : #testing }
CMResourceLocatorTest >> testReadMatrixSep [

	| matrix |
	
	matrix := self instance
		readMatrix: ((self instance dataPath: self sampleModel) / 'simpleMap.csv') fullName
		sep: $;.
	self assert: (matrix isKindOf: Collection).
	self assert: (matrix anyOne isKindOf: Collection)
	
]

{ #category : #testing }
CMResourceLocatorTest >> testVideoPath [
	| cmFileRef |
	cmFileRef := self instance videoPath: self sampleModel.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory
]

{ #category : #testing }
CMResourceLocatorTest >> testWorkingDirectory [

	self assert: (self instance workingDirectory isKindOf: String) 
]

{ #category : #testing }
CMResourceLocatorTest >> testXmlPath [

	| cmFileRef |
	cmFileRef := self instance xmlPath: self sampleModel.
	self
		assert: (cmFileRef isKindOf: FileReference);
		assert: cmFileRef isDirectory
]
