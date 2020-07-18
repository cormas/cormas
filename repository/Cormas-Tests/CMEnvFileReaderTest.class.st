Class {
	#name : #CMEnvFileReaderTest,
	#superclass : #CormasModelTest,
	#instVars : [
		'instance'
	],
	#category : #'Cormas-Tests'
}

{ #category : #accessing }
CMEnvFileReaderTest >> createSampleEnvFile [

	| sampleEnvFile |
	sampleEnvFile := 'assets/models/CormasModelForTest/maps/temp.env' asFileReference.
	sampleEnvFile writeStreamDo: [ :arg1 | arg1 nextPutAll: self sampleEnv ].
	^ sampleEnvFile
]

{ #category : #accessing }
CMEnvFileReaderTest >> instance [
	^ instance
]

{ #category : #accessing }
CMEnvFileReaderTest >> instance: arg1 [
	instance := arg1
]

{ #category : #accessing }
CMEnvFileReaderTest >> newTestModel [
	" See superimplementor's comment "

	^ super newTestModel 
		projectManager: CMProjectManager new;
		yourself
]

{ #category : #accessing }
CMEnvFileReaderTest >> sampleEnv [
	^ 'dimensions	50 50
cloture	torroidal
connexite	eight
attributs	state(Symbol)
dead
dead
dead
dead'
]

{ #category : #accessing }
CMEnvFileReaderTest >> setUp [
	" See superimplementor's comment "

	super setUp.
	self instance: 
		(CMEnvFileReader new
			cormasModel: self newTestModel;
			fileReference: self createSampleEnvFile;
			yourself).
]

{ #category : #accessing }
CMEnvFileReaderTest >> tearDown [ 

	super tearDown.
	self instance fileReference ifNotNil: [ : envFile | envFile ensureDelete ]
]

{ #category : #testing }
CMEnvFileReaderTest >> testCormasModel [

	self assert: (self instance cormasModel isKindOf: CormasModel) 
]

{ #category : #testing }
CMEnvFileReaderTest >> testCormasModelClass [

	self assert: (self instance cormasModelClass isKindOf: CormasModel class) 
]

{ #category : #testing }
CMEnvFileReaderTest >> testElementaryEntities [
	self assert: self instance elementaryEntities
]

{ #category : #testing }
CMEnvFileReaderTest >> testElementaryEntitiesAt [
	self assert: (self instance elementaryEntitiesAt: nil)
]

{ #category : #testing }
CMEnvFileReaderTest >> testFileReference [

	self assert: (self instance fileReference isKindOf: FileReference)
]

{ #category : #testing }
CMEnvFileReaderTest >> testLoadEnvironmentFromFile [
	| matrix |
	
	matrix := self instance loadEnvironmentFromFile: self instance fileReference.
	self assert: matrix isCollection.
	self deny: matrix isEmpty.
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadAttributes [
	self assert: (self instance readAttributes: nil)
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadCloture [

	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self instance readCloture: 'cloture torroidal' substrings.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile ce equals: 'torroidal'
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadConnexite [
	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self instance readConnexite: 'connexite eight' substrings.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile cp equals: 'eight'
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadDelimiter [
	self assert: (self instance readDelimiter: nil)
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadDimensions [
	self assert: (self instance readDimensions: nil)
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadEnvFromFile [

	| envStream |
	
	envStream := self instance readEnvFromFile: self instance fileReference.
	self assert: envStream isStream.
	self deny: envStream atEnd.
	self deny: envStream isBinary.
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadEnvironmentError [

	self should: [ self instance readEnvironmentError ] raise: Error
]

{ #category : #testing }
CMEnvFileReaderTest >> testResolveModelName [
	self assert: (self instance resolveModelName: nil)
]

{ #category : #testing }
CMEnvFileReaderTest >> testResourceLocator [

	self assert: (self instance resourceLocator isKindOf: CMResourceLocator)
]
