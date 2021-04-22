Class {
	#name : #CMEnv2CellsConverter,
	#superclass : #Object,
	#instVars : [
		'endOfLine',
		'numberOfColumns',
		'numberOfRows',
		'attributeDefinitions'
	],
	#category : #'Cormas-Core-Space'
}

{ #category : #utilities }
CMEnv2CellsConverter class >> fromFile: aFileReference [
	"Convert .env aFileReference (such as /Users/.../cormas/assets/models/DemoAggregates/maps/3forests.env) as a new directory called '3forests.cells' containing 2 files (See ISSUE #311 from Tomooda: https://github.com/cormas/cormas/issues/311):
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
	
	self fromFile: (FileLocator workingDirectory / 'assets' /'models' / 'Conway' / 'maps' / 'glidersGun.env')"
	
	aFileReference
		readStreamDo: [ :readStream | 
			self new
				convert: readStream
				intoDirectory: (aFileReference withExtension: 'cells') ensureCreateDirectory ]
]

{ #category : #headers }
CMEnv2CellsConverter >> attributs: anArrayOfString into: aWriteStream [
	attributeDefinitions := anArrayOfString copyWithoutFirst
		collect: [ :def | 
			| index attribute type |
			index := def indexOf: $(.
			(index <= 1 or: def last ~= $))
				ifTrue: [ ^ self error: 'invalid attributs format' ].
			attribute := def copyFrom: 1 to: index - 1.
			type := def copyFrom: index + 1 to: def size - 1.
			self assert: (self availableTypes includes: type).
			attribute -> type ].
	attributeDefinitions
		ifNotEmpty: [ aWriteStream
				nextPutAll: 'attributes:';
				nextPutAll: self endOfLine.
			attributeDefinitions
				do: [ :assoc | 
					aWriteStream
						space;
						nextPutAll: assoc key;
						nextPutAll: ': ';
						nextPutAll: assoc value;
						nextPutAll: self endOfLine ] ]
]

{ #category : #types }
CMEnv2CellsConverter >> availableTypes [
	^ #('Number' 'Boolean' 'Symbol' 'nil')
]

{ #category : #accessing }
CMEnv2CellsConverter >> cellsFileVersion [
	^ '0.0.1' copy
]

{ #category : #headers }
CMEnv2CellsConverter >> cloture: anArrayOfString into: aWriteStream [
	self assert: anArrayOfString size equals: 2.
	self typecheckClosure: anArrayOfString second.
	aWriteStream
		nextPutAll: 'closed: ';
		nextPutAll:
			(anArrayOfString second = 'closed'
				ifTrue: [ 'true' ]
				ifFalse: [ 'false' ]);
		nextPutAll: self endOfLine
]

{ #category : #headers }
CMEnv2CellsConverter >> connexite: anArrayOfString into: aWriteStream [
	self assert: anArrayOfString size equals: 2.
	self typecheckConnectivity: anArrayOfString second.
	aWriteStream
		nextPutAll: 'connectivity: ';
		nextPutAll: anArrayOfString second asString;
		nextPutAll: self endOfLine
]

{ #category : #processing }
CMEnv2CellsConverter >> convert: envStream intoDirectory: cellsFileReference [
	self flush.
	self
		spaceModelFileIn: cellsFileReference
		writeStreamDo: [ :metadataStream | 
			self writeVersionInto: metadataStream.
			self convertHeaders: envStream into: metadataStream ].
	self convertAttributes: envStream intoDirectory: cellsFileReference
]

{ #category : #private }
CMEnv2CellsConverter >> convertAttributes: envStream into: cellsStream [
	self assert: numberOfRows notNil.
	self assert: numberOfColumns notNil.
	self assert: attributeDefinitions notNil.
	attributeDefinitions
		ifNotEmpty: [ | matrix |
			matrix := (1 to: numberOfRows)
				collect: [ :rowIndex | 
					(1 to: numberOfColumns)
						collect: [ :columnIndex | (envStream nextLine trim substrings: ',') collect: #trim ] ].
			cellsStream
				nextPutAll: 'attributes_values:';
				nextPutAll: self endOfLine.
			1 to: attributeDefinitions size do: [ :attributeIndex | 
				| attributeName type |
				attributeName := (attributeDefinitions at: attributeIndex) key.
				type := (attributeDefinitions at: attributeIndex) value.
				cellsStream
					space;
					nextPutAll: attributeName;
					nextPutAll: ':';
					nextPutAll: self endOfLine.
				matrix
					do: [ :values | 
						cellsStream
							space;
							space;
							nextPutAll: '- ['.
						values
							do: [ :attributes | 
								| value |
								value := attributes at: attributeIndex.
								self typecheck: value as: type.
								cellsStream nextPutAll: value ]
							separatedBy: [ cellsStream nextPutAll: ',' ].
						cellsStream
							nextPutAll: ']';
							nextPutAll: self endOfLine ] ] ]
]

{ #category : #private }
CMEnv2CellsConverter >> convertAttributes: envStream intoDirectory: cellsFileReference [
	self assert: numberOfRows notNil.
	self assert: numberOfColumns notNil.
	self assert: attributeDefinitions notNil.
	attributeDefinitions
		ifNotEmpty: [ | matrix |
			matrix := (1 to: numberOfRows)
				collect: [ :rowIndex | 
					(1 to: numberOfColumns)
						collect:
							[ :columnIndex | (envStream nextLine trim substrings: ',') collect: #trim ] ].
			1 to: attributeDefinitions size do: [ :attributeIndex | 
				| attributeName type |
				attributeName := (attributeDefinitions at: attributeIndex) key.
				type := (attributeDefinitions at: attributeIndex) value.
				self
					csvFileIn: cellsFileReference
					forAttribute: attributeName
					writeStreamDo: [ :csvStream | 
						matrix
							do: [ :values | 
								values
									do: [ :attributes | 
										| value |
										value := attributes at: attributeIndex.
										self typecheck: value as: type.
										self writeValue: value into: csvStream ]
									separatedBy: [ csvStream nextPut: $, ].
								csvStream nextPutAll: self endOfLine ] ] ] ]
]

{ #category : #private }
CMEnv2CellsConverter >> convertHeader: aString into: cellsStream [
	aString substrings
		ifNotEmpty: [ :tokens | 
			| selector |
			selector := (tokens first asLowercase , ':into:') asSymbol.
			(self respondsTo: selector)
				ifTrue: [ self perform: selector with: tokens with: cellsStream ] ]
]

{ #category : #private }
CMEnv2CellsConverter >> convertHeaders: envStream into: cellsStream [
	[ attributeDefinitions notNil or: [ envStream atEnd ] ]
		whileFalse: [ self convertHeader: envStream nextLine trim into: cellsStream ]
]

{ #category : #streaming }
CMEnv2CellsConverter >> csvFileIn: cellsFileReference forAttribute: attributeName writeStreamDo: aBlock [
	cellsFileReference ensureCreateDirectory.
	(cellsFileReference / attributeName withExtension: 'csv')
		writeStreamDo: aBlock
]

{ #category : #headers }
CMEnv2CellsConverter >> dimensions: anArrayOfString into: aWriteStream [
	self assert: anArrayOfString size equals: 3.
	self typecheckNat: anArrayOfString second.
	self typecheckNat: anArrayOfString third.
	numberOfRows := anArrayOfString second asInteger.
	numberOfColumns := anArrayOfString third asInteger.
	aWriteStream
		nextPutAll: 'dimensions: [';
		nextPutAll: numberOfRows asString;
		nextPutAll: ', ';
		nextPutAll: numberOfColumns asString;
		nextPutAll: ']';
		nextPutAll: self endOfLine
]

{ #category : #accessing }
CMEnv2CellsConverter >> endOfLine [
	^ endOfLine ifNil: [ endOfLine := OSPlatform current lineEnding ]
]

{ #category : #accessing }
CMEnv2CellsConverter >> endOfLine: aString [
	endOfLine := aString
]

{ #category : #private }
CMEnv2CellsConverter >> flush [
	numberOfColumns := nil.
	numberOfRows := nil.
	attributeDefinitions := nil
]

{ #category : #accessing }
CMEnv2CellsConverter >> internalEndOfLine [
	^ self endOfLine: String cr
]

{ #category : #streaming }
CMEnv2CellsConverter >> spaceModelFileIn: cellsFileReference writeStreamDo: aBlock [
	cellsFileReference ensureCreateDirectory.
	cellsFileReference / 'spaceModel.yml' writeStreamDo: aBlock
]

{ #category : #types }
CMEnv2CellsConverter >> typecheck: aString as: typeString [
	self
		perform: ('typecheck' , typeString capitalized , ':') asSymbol
		with: aString
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckBoolean: aString [
	self assert: (#('true' 'false' 'nil') includes: aString)
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckClosure: aString [
	^ #('torroidal' 'closed') includes: aString
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckConnectivity: aString [
	^ #('three' 'four' 'six' 'eight') includes: aString
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckNat: aString [
	self assert: aString first isDigit
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckNil: aString [
	self assert: aString equals: 'nil'
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckNumber: aString [
	self
		assert:
			(aString = 'nil'
				or: [ aString first isDigit
						or: [ aString first = $-
								and: [ aString size >= 2 and: [ aString second isDigit ] ] ] ])
]

{ #category : #types }
CMEnv2CellsConverter >> typecheckSymbol: aString [
	
]

{ #category : #private }
CMEnv2CellsConverter >> writeValue: aString into: aStream [
	(aString
		anySatisfy: [ :char | char = $" or: [ char = $, or: [ char = Character cr ] ] ])
		ifTrue: [ aStream nextPut: $".
			aString
				do: [ :char | 
					char = $"
						ifTrue: [ aStream nextPut: char ].
					char = Character cr
						ifTrue: [ aStream nextPutAll: self endOfLine ]
						ifFalse: [ aStream nextPut: char ] ] ]
		ifFalse: [ aStream nextPutAll: aString ]
]

{ #category : #private }
CMEnv2CellsConverter >> writeVersionInto: aStream [
	aStream
		nextPutAll: 'version: ';
		nextPutAll: self cellsFileVersion;
		nextPutAll: self endOfLine
]
