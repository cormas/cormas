Class {
	#name : #CMCellsLoader,
	#superclass : #Object,
	#instVars : [
		'isStrict',
		'model',
		'defaultConnectivity',
		'defaultClosed'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #loading }
CMCellsLoader >> attribute: aString type: anotherString in: aFileReference [
	(aFileReference / aString withExtension: 'csv')
		readStreamDo: [ :csvStream | 
			self
				attribute: aString
				type: anotherString
				values: (NeoCSVReader on: csvStream) upToEnd ]
]

{ #category : #loading }
CMCellsLoader >> attribute: aString type: anotherString values: anArrayOfArray [
	self
		spaceModelDo: [ :spaceModel | 
			anotherString ~= 'nil'
				ifTrue: [ | cells typeConversionSelector attributeSetterSelector |
					cells := spaceModel elementaryEntities readStream.
					typeConversionSelector := ('as' , anotherString) asSymbol.
					attributeSetterSelector := (aString , ':') asSymbol.
					anArrayOfArray
						do: [ :array | 
							array
								do: [ :value | 
									cells next
										perform: attributeSetterSelector
										with:
											(value = 'nil'
												ifTrue: [ nil ]
												ifFalse: [ value perform: typeConversionSelector ]) ] ] ] ]
]

{ #category : #loading }
CMCellsLoader >> closed: aString [
	self assert: (#('true' 'false') includes: aString).
	self
		spaceModelDo:
			[ :spaceModel | spaceModel closed: aString ~= 'false' ]
]

{ #category : #loading }
CMCellsLoader >> connectivity: aString [
	| numberOfNeighbours |
	self assert: aString isString.
	numberOfNeighbours := {('3' -> #three).
	('three' -> #three).
	('4' -> #four).
	('four' -> #four).
	('6' -> #six).
	('six' -> #six).
	('8' -> #eight).
	('eight' -> #eight)} asDictionary
		at: aString
		ifAbsent: [ ^ self
				warning: 'Number of neighbors must be one of three, four, six or eight.' ].
	self
		spaceModelDo: [ :spaceModel | spaceModel nbNeighbours: numberOfNeighbours ]
]

{ #category : #defaults }
CMCellsLoader >> defaultClosed [
	^ defaultClosed ifNil: [ defaultClosed := 'true' ]
]

{ #category : #defaults }
CMCellsLoader >> defaultClosed: aString [
	defaultClosed := aString
]

{ #category : #defaults }
CMCellsLoader >> defaultConnectivity [
	^ defaultConnectivity ifNil: [ defaultConnectivity := 'four' ]
]

{ #category : #defaults }
CMCellsLoader >> defaultConnectivity: aString [
	defaultConnectivity := aString
]

{ #category : #loading }
CMCellsLoader >> dimensions: anArray [
	| numLines numColumns |
	self assert: anArray isSequenceable.
	self assert: anArray size equals: 2.
	numLines := anArray first asInteger
		ifNil: [ ^ self
				warning:
					'number of lines must be a positive integer, but found "'
						, anArray first asString , '"' ].
	numColumns := anArray second asInteger
		ifNil: [ ^ self
				warning:
					'number of columns must be a positive integer, but found "'
						, anArray second asString , '"' ].
	self
		spaceModelDo: [ :spaceModel | spaceModel line: numLines column: numColumns ]
]

{ #category : #initialization }
CMCellsLoader >> initialize [
	super initialize.
	isStrict := true
]

{ #category : #testing }
CMCellsLoader >> isStrict [
	^ isStrict = true
]

{ #category : #accessing }
CMCellsLoader >> isStrict: aBoolean [
	isStrict := aBoolean = true
]

{ #category : #loading }
CMCellsLoader >> load: aFileReference [
	| metadata |
	metadata := PPYAMLGrammar new end
		parse: (aFileReference / 'spaceModel.yml') contents withInternalLineEndings.
	self
		dimensions:
			(metadata
				at: 'dimensions'
				ifAbsent: [ ^ self error: 'dimensions field is mandatory' ]).
	self
		connectivity: (metadata at: 'connectivity' ifAbsent: [ self defaultConnectivity ]).
	self
		spaceModelDo: [ :spaceModel | 
			spaceModel
				resetSpatialEntities;
				createCells ].
	self
		closed: (metadata at: 'closed' ifAbsent: [ self defaultClosed ]).
	metadata
		at: 'attributes'
		ifPresent: [ :attributes | 
			attributes
				keysAndValuesDo: [ :name :type | self attribute: name type: type in: aFileReference ] ]
]

{ #category : #accessing }
CMCellsLoader >> setStrict [
	self isStrict: true
]

{ #category : #accessing }
CMCellsLoader >> spaceModel [
	^ model
]

{ #category : #accessing }
CMCellsLoader >> spaceModel: aCMSpaceModel [
	model := aCMSpaceModel
]

{ #category : #accessing }
CMCellsLoader >> spaceModelDo: aBlock [
	model ifNotNil: [ aBlock cull: model spaceModel ]
]

{ #category : #accessing }
CMCellsLoader >> unsetStrict [
	self isStrict: false
]

{ #category : #'error signalling' }
CMCellsLoader >> warning: aString [
	self isStrict
		ifTrue: [ self error: aString ]
]
