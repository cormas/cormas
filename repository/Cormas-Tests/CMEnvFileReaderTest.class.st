Class {
	#name : #CMEnvFileReaderTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'envFileReader'
	],
	#category : #'Cormas-Tests'
}

{ #category : #accessing }
CMEnvFileReaderTest >> createSampleEnvFile [

	| sampleEnvFile |
	sampleEnvFile := (CMResourceLocator new mapsPath: self sampleModelPath) / 'temp.env'.
	sampleEnvFile writeStreamDo: [ :arg1 | arg1 nextPutAll: self sampleEnv ].
	^ sampleEnvFile
]

{ #category : #accessing }
CMEnvFileReaderTest >> envFileReader [
	^ envFileReader
]

{ #category : #accessing }
CMEnvFileReaderTest >> envFileReader: aCMEnvFileReader [

	envFileReader := aCMEnvFileReader
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
CMEnvFileReaderTest >> sampleModelPath [
	
	^ 'CormasModelForTest'
]

{ #category : #running }
CMEnvFileReaderTest >> setUp [
	" See superimplementor's comment "

	super setUp.
	self envFileReader: 
		(CMEnvFileReader new
			cormasModel: self newTestModel;
			fileReference: self createSampleEnvFile;
			yourself).
]

{ #category : #running }
CMEnvFileReaderTest >> tearDown [ 

	self envFileReader fileReference ifNotNil: [ : envFile | envFile ensureDelete ].
	(CMResourceLocator new modelPath: self sampleModelPath) ensureDeleteAll. 
	super tearDown.
]

{ #category : #test }
CMEnvFileReaderTest >> testCmEnvFile [

	self assert: (self envFileReader cmEnvFile isKindOf: CMEnvFile).
]

{ #category : #testing }
CMEnvFileReaderTest >> testCormasModel [
	self
		assert: (self envFileReader cormasModel isKindOf: CMAbstractModel)
]

{ #category : #testing }
CMEnvFileReaderTest >> testCormasModelClass [
	self
		assert: (self envFileReader cormasModelClass isKindOf: CMAbstractModel class)
]

{ #category : #testing }
CMEnvFileReaderTest >> testElementaryEntities [

	self assert: (self envFileReader elementaryEntities allSatisfy: [ : e | e isKindOf: CMSpatialEntityElement ])
]

{ #category : #testing }
CMEnvFileReaderTest >> testFileReference [

	self assert: (self envFileReader fileReference isKindOf: FileReference)
]

{ #category : #testing }
CMEnvFileReaderTest >> testLoadEnvironmentFromFile [

	| cmEnvFile |
	self envFileReader loadEnvironmentFromFile: self envFileReader fileReference.
	
	cmEnvFile := self envFileReader cmEnvFile.
	self assert: cmEnvFile  matrix isCollection.
	self deny: cmEnvFile matrix isEmpty.
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadAttributes [

	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self envFileReader readAttributes: { 'attributs biomass(Number)' substrings }.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile attributes isCollection.
	self assertCollection: (cmEnvFile attributeAt: 1) hasSameElements: { #biomass: . #asNumber }.
	
	cmEnvFileReader := self envFileReader readAttributes: { 'attributs seed(nil) tree(Boolean)' substrings }.
	self assertCollection: (cmEnvFile attributeAt: 2) hasSameElements: { #tree: . #asBoolean }.
	
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadCloture [

	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self envFileReader readCloture: 'cloture torroidal' substrings.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile ce equals: 'torroidal'
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadConnexite [
	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self envFileReader readConnexite: 'connexite eight' substrings.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile cp equals: 'eight'
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadDimensions [
	| cmEnvFileReader cmEnvFile |
	cmEnvFileReader := self envFileReader readDimensions: 'dimensions 50 10' substrings.
	cmEnvFile := cmEnvFileReader cmEnvFile.
	self assert: (cmEnvFileReader isKindOf: CMEnvFileReader).
	self assert: cmEnvFile dimX equals: 50.
	self assert: cmEnvFile dimY equals: 10
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadEnvFromFile [

	| envStream |
	
	envStream := self envFileReader readEnvFromFile: self envFileReader fileReference.
	self assert: envStream isStream.
	self deny: envStream atEnd.
	self deny: envStream isBinary.
]

{ #category : #testing }
CMEnvFileReaderTest >> testReadEnvironmentError [

	self should: [ self envFileReader readEnvironmentError ] raise: Error
]

{ #category : #testing }
CMEnvFileReaderTest >> testResolveModelName [

	self envFileReader cormasModel: CMConwayModel new.
	self assert: (self envFileReader resolveModelName: 'CMConwayModel') equals: 'Conway'.
	self assert: (self envFileReader resolveModelName: 'Conway') equals: 'Conway'.
]

{ #category : #testing }
CMEnvFileReaderTest >> testResourceLocator [

	self assert: (self envFileReader resourceLocator isKindOf: CMResourceLocator)
]
