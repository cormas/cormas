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
CMEnv2CellsConverter class >> from: envStream [
	^ String
		streamContents: [ :stream | self new convert: envStream readStream into: stream ]
]

{ #category : #utilities }
CMEnv2CellsConverter class >> from: env to: cells [
	self new convert: env readStream into: cells writeStream
]

{ #category : #utilities }
CMEnv2CellsConverter class >> fromFile: envFile [
	envFile readStreamDo: [ :readStream | ^ self from: readStream ]
]

{ #category : #utilities }
CMEnv2CellsConverter class >> fromFile: env toFile: cells [
	env
		readStreamDo: [ :readStream | 
			cells
				writeStreamDo: [ :writeStream | self new convert: readStream into: writeStream ] ]
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
	aWriteStream
		nextPutAll: 'attributes_defs:';
		nextPutAll: self endOfLine.
	attributeDefinitions
		do: [ :assoc | 
			aWriteStream
				space;
				nextPutAll: assoc key;
				nextPutAll: ': ';
				nextPutAll: assoc value;
				nextPutAll: self endOfLine ]
]

{ #category : #types }
CMEnv2CellsConverter >> availableTypes [
	^ #('Number' 'Boolean' 'nil')
]

{ #category : #headers }
CMEnv2CellsConverter >> cloture: anArrayOfString into: aWriteStream [
	self assert: anArrayOfString size equals: 2.
	self typecheckClosure: anArrayOfString second.
	aWriteStream
		nextPutAll: 'closure: ';
		nextPutAll:
			(anArrayOfString second = 'closed'
				ifTrue: [ 'closed' ]
				ifFalse: [ 'toroidal' ]);
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
CMEnv2CellsConverter >> convert: envStream [
	^ String
		streamContents: [ :cellsStream | 
			self
				internalEndOfLine;
				convert: envStream into: cellsStream ]
]

{ #category : #processing }
CMEnv2CellsConverter >> convert: envStream into: cellsStream [
	self flush.
	self convertHeaders: envStream into: cellsStream.
	self convertAttributes: envStream into: cellsStream
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

{ #category : #headers }
CMEnv2CellsConverter >> dimensions: anArrayOfString into: aWriteStream [
	self assert: anArrayOfString size equals: 3.
	self typecheckNat: anArrayOfString second.
	self typecheckNat: anArrayOfString third.
	numberOfColumns := anArrayOfString second asInteger.
	numberOfRows := anArrayOfString third asInteger.
	aWriteStream
		nextPutAll: 'dimensions: [';
		nextPutAll: numberOfColumns asString;
		nextPutAll: ', ';
		nextPutAll: numberOfRows asString;
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
