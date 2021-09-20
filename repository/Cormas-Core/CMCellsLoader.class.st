"
Parse, validate and creates a grid from a cells directory.

 Example of string: 'poor.cells' 
 See ISSUE #311 from Tomooda: https://github.com/cormas/cormas/issues/311:

The old .env file is split into multiple files in a directory with a YAML file for parameters of the space model and CSV files corresponding to its attributes.

For example, assuming that we have the following Sample.env file:

		dimensions      27 27
		cloture closed
		connexite       eight
		delimiteur      0
		attributs       biomass(Number)
		2
		3
		1
		...

Now there is a 'Sample.cells' directory with the following 'spaceModel.yml

		version: 0.0.1
		dimensions: [27, 27]
		closed: false
		connectivity: eight
		attributes:
 			biomass: Number
+ a biomass.csv file of 27 lines and 27 columns:
	2,3,1,...
	9,2,6,...

 
Internal Representation and Key Implementation Points.

    Instance Variables
	defaultClosed:		<Object>
	defaultConnectivity:		<Object>
	isStrict:		<Object>
	model:		<Object>


    Implementation Points
"
Class {
	#name : #CMCellsLoader,
	#superclass : #CMObject,
	#instVars : [
		'isStrict',
		'model',
		'defaultConnectivity',
		'defaultClosed',
		'metadata',
		'cellsFile'
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
CMCellsLoader >> cellFileDirectory [
	" Answer a <FileReference> to the maps subdirectory of the model.
	Ex: /Users/.../cormas/assets/models/ECEC/maps"

	^ self resourceLocator mapsPath: self cormasModelClass shortName
]

{ #category : #loading }
CMCellsLoader >> closed: aString [

	self assert: (#('true' 'false') includes: aString).
	self spaceModelDo: [ : spaceModel | spaceModel torroidal: aString ~= 'false' ]
]

{ #category : #loading }
CMCellsLoader >> connectivity: aString [
	| numberOfNeighbours gridSelector |
	
	self assert: aString isString.
	numberOfNeighbours := self nbNormalization: aString.
	gridSelector := self gridShapeSelectors:numberOfNeighbours.
	self spaceModelDo: [ :spaceModel | 
		spaceModel 
			nbCount: numberOfNeighbours;
			gridCellShape: gridSelector ]
]

{ #category : #loading }
CMCellsLoader >> cormasModelClass [

	^ self spaceModel cormasModelClass
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

{ #category : #loading }
CMCellsLoader >> gridShapeSelectors: numberOfNeighbours [
	" Answer a <Symbol> with the selector for configuring the grid shape in the space model "
	
	^ { 
		(#three -> #triangular).
		(#four -> #squared ) .
		(#eight -> #squared).
		(#six -> #hexagonal).
		(nil -> #irregular)	
		} asDictionary
			at: numberOfNeighbours
			ifAbsent: [ ^ self warning: 'Number of neighbors must be one of three, four, six or eight.' ].
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
	" If aFileReference is a valid .env file, then parse it and set space model properties "

	self 
		validate: aFileReference;
		parse.

]

{ #category : #loading }
CMCellsLoader >> nbNormalization: aString [

	^ {
		('3' -> #three) .
		('three' -> #three) .

		('4' -> #four) .
		('four' -> #four) .

		('6' -> #six)  .
		('six' -> #six) .

		('8' -> #eight).
		('eight' -> #eight) } asDictionary
			at: aString
			ifAbsent: [ ^ self warning: 'Number of neighbors must be one of three, four, six or eight.' ].
]

{ #category : #parsing }
CMCellsLoader >> parse [
	" Parse the receiver's configured cells fiel. Instantiate a new grid of cells from aFileReference (with .cells extension) such as /Users/.../cormas/assets/models/ECEC/maps/poor.cells"
	
	
	metadata := PPYAMLGrammar new end parse: self spaceModelFile.
	self 
		parseDimensions;
		parseConnectivity;
		parseClosed;
		parseAttributes.
]

{ #category : #parsing }
CMCellsLoader >> parseAttributes [

	metadata
		at: 'attributes'
		ifPresent: [ : attributes | 
			attributes keysAndValuesDo: [ :name :type | self attribute: name type: type in: cellsFile ] ]
]

{ #category : #parsing }
CMCellsLoader >> parseClosed [
		
	self closed: (metadata at: 'closed' ifAbsent: [ self defaultClosed ]).

]

{ #category : #parsing }
CMCellsLoader >> parseConnectivity [

	self connectivity: (metadata at: 'connectivity' ifAbsent: [ self defaultConnectivity ]).
]

{ #category : #parsing }
CMCellsLoader >> parseDimensions [

	self dimensions: (metadata
				at: 'dimensions'
				ifAbsent: [ ^ self error: 'dimensions field is mandatory' ]).

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

{ #category : #parsing }
CMCellsLoader >> spaceModelFile [
	" Answer a <String> with the contents of the cells space model YAML file "

	^ (cellsFile / 'spaceModel.yml') contents withInternalLineEndings
]

{ #category : #accessing }
CMCellsLoader >> unsetStrict [
	self isStrict: false
]

{ #category : #loading }
CMCellsLoader >> validate: aStringOrFileReference [
	" If aFileReference is a valid YAML file, answer the receiver, otherwise raise an <Exception> "
	
	| envFile |
	cellsFile := aStringOrFileReference isString
		             ifTrue: [ self cellFileDirectory / aStringOrFileReference ]
		             ifFalse: [ aStringOrFileReference ].
	cellsFile exists ifTrue: [ ^ self ].
	envFile := cellsFile withExtension: 'env'.
	envFile exists
		ifTrue: [ CMEnv2CellsConverter fromFile: envFile ]
		ifFalse: [ ^ self error: 'No such a file.' ]
]

{ #category : #'error signalling' }
CMCellsLoader >> warning: aString [
	self isStrict
		ifTrue: [ self error: aString ]
]
