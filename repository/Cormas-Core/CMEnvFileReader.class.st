Class {
	#name : #CMEnvFileReader,
	#superclass : #Object,
	#instVars : [
		'cormasModel',
		'fileReference',
		'cmEnvironment'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #accessing }
CMEnvFileReader >> cmEnvironment [
	^ cmEnvironment
]

{ #category : #accessing }
CMEnvFileReader >> cmEnvironment: anObject [
	cmEnvironment := anObject
]

{ #category : #accessing }
CMEnvFileReader >> cormasModel [
	" Answer a <CormasModel> "
	
	^ self spaceModel cormasModel
]

{ #category : #accessing }
CMEnvFileReader >> cormasModelClass [
	^ self cormasModel class.
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
	
	| matrix |
	"stream := self readEnvFromFile: aFilename."
	matrix := self resourceLocator readMatrix: aFilename sep: Character tab.
	"Lecture des 4 premieres lignes : topologie de la grille"	"On devine le format des lignes"
	" stream installLineEndConventionInConverter."
	self 
		readDimensions: matrix first;
		readCloture: matrix second;
		readConnexite: matrix third;
		readDelimiter: (matrix allButFirst: 3);
		readBackgroundColor: matrix;
		readIsFull: matrix;
		readAttributes: matrix.
	^ matrix
	

]

{ #category : #'accessing - parsing' }
CMEnvFileReader >> parseAttributesFrom: dataLine [
	" Answer a <Collection> of two elements "

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
CMEnvFileReader >> readAttributes: aCollection [

	aCollection 
		detect: [: c | c first = 'attributs'] 
		ifFound: [ : delimLine | ]
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readBackgroundColor: aCollection [ 

	aCollection 
		detect: [:c | c first = 'backgroundColor']
		ifFound: [ : aLine |
			| bgColor |
			bgColor := Color 
				red: aLine last substrings first asNumber
				green: aLine last substrings second asNumber
				blue: aLine last substrings last asNumber. 
			self cormasModel 
				registerSpaceModelChange: #backgroundColor 
				with: bgColor ].
]

{ #category : #'accessing - private' }
CMEnvFileReader >> readCloture: aCollection [

	aCollection first ~= 'cloture'
		ifTrue: [ ^ self readEnvironmentError ] .
	self cmEnvironment ce: aCollection last.

]

{ #category : #'accessing - private' }
CMEnvFileReader >> readConnexite: aCollection [

	aCollection first ~= 'connexite'
		ifTrue: [ ^ self readEnvironmentError ].
	self cmEnvironment cp: aCollection last
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
	self cmEnvironment dimX: (self readXDimension: aCollection last).
	self cmEnvironment dimY: (self readYDimension: aCollection last).

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
