Class {
	#name : #CMEnvFileReader,
	#superclass : #Object,
	#instVars : [
		'cormasModel',
		'label',
		'dimX',
		'dimY',
		'ce',
		'fileReference',
		'cp',
		'delimiteur',
		'attype'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #'instance creation' }
CMEnvFileReader class >> forModel: aCMSpaceModel [
	" Answer a new instance of the receiver using aCormasModel mainly for resource location "

	^ self new
		initializeWithModel: aCMSpaceModel;
		yourself
]

{ #category : #'accessing - public' }
CMEnvFileReader >> addEnvironmentDataFromFile: aFilename [
	"Add attributs value to cells from an .env file"

	"aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env'  or
				aName = a FATFilename('d:\Vw5i.4\cormas\Models\JLB\maps\test.env')"

	| stream |
	"Lecture des 4 premieres lignes : topologie de la grille"
	"On devine le format des lignes"
	stream := self readEnvFromFile: aFilename.
	"stream lineEndAuto."
	self consumeAttributesFrom: stream.
	self setSpatialEntitiesAttributesValueFrom: stream
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> attributeAt: aNumber [

	^ self attributes at: aNumber 
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> attributes [

	^ attype
		ifNil: [ attype := OrderedCollection new ]
]

{ #category : #accessing }
CMEnvFileReader >> ce [
	^ ce
]

{ #category : #accessing }
CMEnvFileReader >> ce: anObject [
	ce := anObject
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> consumeAttributesFrom: stream [

	stream upTo: Character tab.
	(stream upTo: Character space) asNumber.
	(stream upTo: Character cr) asNumber.
	stream upTo: Character tab.
	(stream upTo: Character cr) asSymbol.
	stream upTo: Character tab.
	(stream upTo: Character cr) asSymbol.
	stream upTo: Character tab.
	(stream upTo: Character cr) asNumber
]

{ #category : #accessing }
CMEnvFileReader >> cormasModel [
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

{ #category : #accessing }
CMEnvFileReader >> cp [
	^ cp
]

{ #category : #accessing }
CMEnvFileReader >> cp: anObject [
	cp := anObject
]

{ #category : #accessing }
CMEnvFileReader >> delimiteur [
	^ delimiteur
]

{ #category : #accessing }
CMEnvFileReader >> delimiteur: anObject [
	delimiteur := anObject
]

{ #category : #accessing }
CMEnvFileReader >> dimX [
	^ dimX
]

{ #category : #accessing }
CMEnvFileReader >> dimX: anObject [
	dimX := anObject
]

{ #category : #accessing }
CMEnvFileReader >> dimY [
	^ dimY
]

{ #category : #accessing }
CMEnvFileReader >> dimY: anObject [
	dimY := anObject
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> elementaryEntities [

	^ self cormasModel elementaryEntities
]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> elementaryEntitiesAt: lineNumber [ 

	^ self elementaryEntities at: lineNumber
]

{ #category : #accessing }
CMEnvFileReader >> fileReference [
	^ fileReference
]

{ #category : #accessing }
CMEnvFileReader >> fileReference: anObject [
	fileReference := anObject
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> firstAttributeAt: i [
	^ (self attributeAt: i) first
]

{ #category : #initialization }
CMEnvFileReader >> initializeWithModel: aCMSpaceModel [ 

	self cormasModel: aCMSpaceModel.
]

{ #category : #accessing }
CMEnvFileReader >> label [
	^ label
]

{ #category : #accessing }
CMEnvFileReader >> label: anObject [
	label := anObject
]

{ #category : #'accessing - attributes' }
CMEnvFileReader >> lastAttributeAt: i [
	^ (self attributeAt: i) last
]

{ #category : #'accessing - public' }
CMEnvFileReader >> loadEnvironmentFromFile: aFilename [
	" Load a grid stored as filename.
	aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env'  or
				aName = a FATFilename('d:\Vw5i.4\cormas\Models\JLB\maps\test.env')"
	
	| stream |
	stream := self readEnvFromFile: aFilename.
	"Lecture des 4 premieres lignes : topologie de la grille"	"On devine le format des lignes"
	" stream installLineEndConventionInConverter."
	self 
		readDimensions: stream;
		readCloture: stream;
		readConnexite: stream;
		readDelimiter: stream.
	^ stream
	

]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseAttributesFrom: dataLine [

	| couple name type |
	couple := OrderedCollection new.
	name := dataLine upTo: $(.
	name := (name , ':') asSymbol.
	type := dataLine upTo: $).
	type := ('as' , type) asSymbol.
	dataLine skipSeparators.
	couple
		add: name;
		add: type.
	^ couple
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

{ #category : #'accessing - private' }
CMEnvFileReader >> readAttributes: aStream [

	| dataLine |
	dataLine := self readNextLineAsSymbol: aStream.	
	label := dataLine upTo: Character tab.
	label ~= 'attributs'
		ifTrue: [ ^ self error: 'Error while reading input stream. We expected "attributs" line'].
	^ dataLine
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readCloture: stream [

	stream skipSeparators.
	label := stream upTo: Character tab.
	label ~= 'cloture'
		ifTrue: [ ^ self readEnvironmentError ] .
	ce := self readNextLineAsSymbol: stream.

]

{ #category : #'accessing - private' }
CMEnvFileReader >> readConnexite: aStream [

	aStream skipSeparators.
	label := aStream upTo: Character tab.
	label ~= 'connexite'
		ifTrue: [ ^ self readEnvironmentError ].
	cp := self readNextLineAsSymbol: aStream
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readDelimiter: aStream [

	aStream skipSeparators.
	label := aStream upTo: Character tab.
	label = 'delimiteur'
		ifTrue: [
			"read data"
			aStream skipSeparators.
			delimiteur := aStream upTo: Character cr.	"process data"
			"delimiteur = 1
				ifTrue:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel1]
				ifFalse:
					[self cormasModel registerSpaceModelChange: #delimitorSize with: #pixel0]" ].
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readDimensions: aStream [

	label := aStream upTo: Character tab.
	label ~= 'dimensions'
		ifTrue: [ self readEnvironmentError ].
	dimX := (aStream upTo: Character space) asNumber.
	dimY := (self readNextLine: aStream) asNumber.

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

{ #category : #'accessing - parsing' }
CMEnvFileReader >> readNextLine: aStream [

	^ aStream upTo: Character cr

]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> readNextLineAsSymbol: aStream [

	^ (self readNextLine: aStream) asSymbol
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

{ #category : #'accessing - parsing' }
CMEnvFileReader >> setSpatialEntitiesAttributesValueFrom: aStream [
	"lecture des valeurs des attributs, et maj des entites spatiales a partir de ces valeurs"

	"balayage de gauche a droite et de bas en haut"

	"Lecture de la 5e ligne: noms des attributs et leur type pour conversion"

	| dataLine |
	aStream skipSeparators.
	dataLine := self readAttributes: aStream.
	[ dataLine atEnd ]
		whileFalse: [ 
			| couple |
			couple := self parseAttributesFrom: dataLine.
			self attributes add: couple ].
	dataLine close.
	self parseSpatialEntitiesAttributeValuesFrom: aStream.
	aStream close
]

{ #category : #'accessing - private' }
CMEnvFileReader >> stringToFilename: aStringOrFilename [
	"Returns a Filename from (aStringOrFilename) located into the current model 'maps' 
	directory (ex: 'cormas.env') "

	| aFilename modelFolderName |
	aStringOrFilename isString
		ifTrue: [ 
			modelFolderName := self resolveModelName: aStringOrFilename.
			aFilename := (self resourceLocator mapsPath: modelFolderName) / aStringOrFilename ]
		ifFalse: [ aFilename := aStringOrFilename ].
	^ aFilename
]
