"
Example:

| envFileRef cmModel |

envFileRef := (CMResourceLocator new mapsPath: 'Conway') / 'cormas.env'.
(CMSpaceModel forModel: cmModel) loadEnvironmentFromFile: envFileRef.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	cmEnvironment:		<Object>
	cormasModel:		<Object>
	fileReference:		<Object>
	spaceModel:		<Object>


    Implementation Points
"
Class {
	#name : #CMEnvFileReader,
	#superclass : #Object,
	#instVars : [
		'spaceModel',
		'fileReference',
		'cmEnvironment',
		'cormasModel'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #examples }
CMEnvFileReader class >> example1 [

	| envFileRef cmModel |

	cmModel := (CMTestModel initialize; 	new)
		activeInit: #initAlive;
		initSimulation;
		initializeSpaceModel;
		createGridLines: 20
			columns: 10
			neighbourhood: 4
			closed: true;
		projectManager: CMProjectManager new;
		yourself.
	envFileRef := (CMResourceLocator new mapsPath: 'Conway') / 'cormas.env'.
	(CMSpaceModel forModel: cmModel) loadEnvironmentFromFile: envFileRef.
]

{ #category : #'instance creation' }
CMEnvFileReader class >> forSpaceModel: aCMSpaceModel [

	^ self new 
		spaceModel: aCMSpaceModel;
		initialize;
		yourself.
]

{ #category : #accessing }
CMEnvFileReader >> attributes [
	" Answer a <Collection> of receiver's attributes "

	^ self cmEnvFile attributes
]

{ #category : #private }
CMEnvFileReader >> buildEnvFileFrom: aCollection [ 
	" Parse and configure the receiver's CMEnvFile from aCollection (of Matrix form) "

	self 
		readDimensions: aCollection first;
		readCloture: aCollection second;
		readConnexite: aCollection third;
		readDelimiter: (aCollection allButFirst: 3);
		readBackgroundColor: aCollection;
		readIsFull: aCollection;
		readAttributes: aCollection.
	self cmEnvFile matrix: aCollection.
]

{ #category : #accessing }
CMEnvFileReader >> cmEnvFile [
	^ cmEnvironment
		ifNil: [ cmEnvironment := CMEnvFile new ]
]

{ #category : #accessing }
CMEnvFileReader >> cmEnvFile: anObject [
	cmEnvironment := anObject
]

{ #category : #accessing }
CMEnvFileReader >> cormasModel [
	" Answer the receiver's <CormasModel> "
	
	^ cormasModel
]

{ #category : #accessing }
CMEnvFileReader >> cormasModel: anObject [

	cormasModel := anObject
]

{ #category : #accessing }
CMEnvFileReader >> cormasModelClass [
	^ self cormasModel class.
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> elementaryEntities [
	" Answer a <Collection> of <CMSpatialEntityElement> "

	^ self spaceModel elementaryEntities
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> elementaryEntitiesAt: lineNumber [ 

	^ self elementaryEntities at: lineNumber
]

{ #category : #accessing }
CMEnvFileReader >> fileReference [
	" Answer a <FileReference> to the receiver's .env file "

	^ fileReference
]

{ #category : #accessing }
CMEnvFileReader >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> firstAttributeAt: i [
	^ (self cmEnvFile attributeAt: i) first
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> lastAttributeAt: i [
	^ (self cmEnvFile attributeAt: i) last
]

{ #category : #'accessing - public' }
CMEnvFileReader >> loadEnvironmentFromFile: aFileRefereceOrFilename [
	" Load a grid stored as filename "
	
	| matrix fileRef |
	
	fileRef := aFileRefereceOrFilename isString 
		ifTrue: [  ((self resourceLocator mapsPath: self cormasModelClass modelPrefix) / aFileRefereceOrFilename) ]
		ifFalse: [ aFileRefereceOrFilename  ].
	matrix := self resourceLocator 
		readMatrix: fileRef
		sep: Character tab.
	self buildEnvFileFrom: matrix.

	

]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseAttributesFrom: dataLine [
	" Parse dataLine and answer a <Collection> of two <Symbol> matching attribute name and conversion selector "

	| couple typeAttr typeName |
	couple := OrderedCollection new.
	typeAttr := dataLine last.
	typeName := self parseTypeNameFrom: typeAttr.
	^ couple
		add: (self parseTypeAttrFrom: typeAttr) asMutator;
		add: ('as' , typeName) asSymbol;
		yourself
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseSpatialEntitiesAttributeValuesFrom: aStream [

	| dataLine numLigne i |
	
	numLigne := 0.
	[ aStream atEnd ]
		whileFalse: [
			"dataLine skipSeparators."
			dataLine := self readNextLine: aStream.
			numLigne := numLigne + 1.
			i := 0.
			[ dataLine atEnd ]
				whileFalse: [ 
					i := i + 1.
					self 
						parseSpatialEntitiesDataLinesFrom: aStream 
						line: dataLine 
						lineNumber: numLigne
						attNumber: i ] ].
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseSpatialEntitiesDataLinesFrom: aStream line: dataLine lineNumber: numLigne attNumber: i [
	| aCell valeur |
	dataLine skipSeparators.
	valeur := dataLine upTo: $,.
	aCell := self elementaryEntitiesAt: numLigne.
	(self lastAttributeAt: i) = #asEntity
		ifTrue: [ 
			valeur := (valeur findTokens: $.) last asSymbol.
			aCell perform: (self firstAttributeAt: i) with: valeur ]
		ifFalse: [ 
			aCell
				perform: (self firstAttributeAt: i)
				with:
					(valeur = 'nil'
						ifFalse: [ valeur perform: (self lastAttributeAt: i) ]
						ifTrue: [ nil ]) ].
	dataLine close
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseTypeAttrFrom: typeAttr [
		
	^ (typeAttr copyUpTo: $() asSymbol
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseTypeNameFrom: typeAttr [
	
	^ (typeAttr findTokens: $() last allButLast
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readAttributes: aCollection [

	aCollection 
		detect: [: c | c first = 'attributs'] 
		ifFound: [ : delimLine | self attributes add: (self parseAttributesFrom: delimLine) ]
		ifNone: [ self crLog: 'The file has no data about attributes' ]
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readBackgroundColor: aCollection [ 

	aCollection 
		detect: [:c | c first = 'backgroundColor']
		ifFound: [ : aLine |
			| bgColor colors |
			colors := aLine last substrings.
			bgColor := Color 
				red: colors first asNumber
				green: colors second asNumber
				blue: colors last asNumber. 
			self cormasModel 
				registerSpaceModelChange: #backgroundColor 
				with: bgColor ].
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readCloture: aCollection [

	aCollection first ~= 'cloture'
		ifTrue: [ ^ self readEnvironmentError ] .
	self cmEnvFile ce: aCollection last asSymbol.

]

{ #category : #'accessing - private' }
CMEnvFileReader >> readConnexite: aCollection [

	aCollection first ~= 'connexite'
		ifTrue: [ ^ self readEnvironmentError ].
	self cmEnvFile cp: aCollection last asSymbol
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readDelimiter: aCollection [

	aCollection 
		detect: [: c | c first = 'delimiteur'] 
		ifFound: [ : delimLine | 
			delimLine last asNumber = 1
				ifTrue: [ self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel1 ]
				ifFalse: [ self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel0 ] ].
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readDimensions: aCollection [

	aCollection first ~= 'dimensions'
		ifTrue: [ self readEnvironmentError ].
	self cmEnvFile dimX: (self readXDimension: aCollection second).
	self cmEnvFile dimY: (self readYDimension: aCollection last).

]

{ #category : #'accessing - private' }
CMEnvFileReader >> readEnvFromFile: aFilename [

	(fileReference := self stringToFilename: aFilename) exists 
		ifFalse: [ ^ self error: 'Missing environment file: ' , aFilename asString ].
	^ fileReference readStream.	
]

{ #category : #'private - notification' }
CMEnvFileReader >> readEnvironmentError [

	^ self error: 'Read error while reading environment file: ' , self fileReference fullName
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readIsFull: aCollection [

	aCollection 
		detect: [:c | c first = 'full'] 
		ifFound: [ : aLine | self spaceModel isFull: aLine last ]
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readXDimension: aString [ 
	" Private - aString is in form '<Number> <Number>'. Answer the first object as <Number> "
	
	^ aString substrings first asNumber
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readYDimension: aString [ 
	" Private - aString is in form '<Number> <Number>'. Answer the last object as <Number> "
	
	^ aString substrings last asNumber
]

{ #category : #'accessing - private' }
CMEnvFileReader >> resolveModelName: aStringOrFilename [
	"Very bad hack to remove CM and Model to a model name ..."
	
	| modelFolderName |
	self flag: #shouldBeRevised.
	modelFolderName := self cormasModelClass name.
	(modelFolderName beginsWith: 'CM')
		ifTrue: [ modelFolderName := modelFolderName allButFirst: 2 ].
	(modelFolderName endsWith: 'Model')
		ifTrue: [ modelFolderName := modelFolderName allButLast: 5 ].
	^ modelFolderName
]

{ #category : #'accessing - private' }
CMEnvFileReader >> resourceLocator [
	" Answer the receiver's model <CMResourceLocator> "

	^ self cormasModel resourceLocator 
]

{ #category : #accessing }
CMEnvFileReader >> spaceModel [

	^ self cormasModel spaceModel
]

{ #category : #accessing }
CMEnvFileReader >> spaceModel: anObject [

	self cormasModel spaceModel: anObject
]

{ #category : #'accessing - private' }
CMEnvFileReader >> stringToFilename: aStringOrFilename [
	"Returns a <FileReference> from (aStringOrFilename) located into the current model 'maps' 
	directory (ex: 'cormas.env') "

	| aFilename modelFolderName |
	aStringOrFilename isString
		ifTrue: [ 
			modelFolderName := self resolveModelName: aStringOrFilename.
			aFilename := (self resourceLocator mapsPath: modelFolderName) / aStringOrFilename ]
		ifFalse: [ aFilename := aStringOrFilename asFileReference ].
	^ aFilename
]
