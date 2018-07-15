"
a class for helping about type tests
usefull for #isKindOf: elimination
"
Class {
	#name : #CormasHelper,
	#superclass : #Object,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
CormasHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	self subclassResponsibility
]

{ #category : #'unit tests' }
CormasHelper class >> assert: aValue equals: expectedValue [
	
	aValue = expectedValue
		ifFalse:
			[self
				error:
					('<1p> was not the expected value <2p>' expandMacrosWith: aValue with:
							expectedValue)]
]

{ #category : #helping }
CormasHelper class >> colorFrom: aSymbolOrColorValue [
	"return a color value for the argument"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> elementsOf: collec1 equalElemenstOf: collec2 [
	"cheks if the elements of a collection or of a dictionnary are the same in both objects"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not a String)"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeEntity [
	"test if the helped object is an entity"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeEntityClass [
	"test if the helped class is Entity"
	
	^self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> isTypeNumber [
	"test if the helped objet is a Number"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CormasHelper class >> isTypeSet [
	"test if the helped objet is a set"
	
	^self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	self subclassResponsibility
]

{ #category : #helping }
CormasHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument or the argument itself "
	
	self subclassResponsibility
]

{ #category : #'unit tests' }
CormasHelper class >> verify [
	"
	self verify
	"
	
	self
		assert: 'abc' cormasHelper isTypeString
		equals: true.
	self
		assert: 'abc' cormasHelper isTypeArray
		equals: false.
	self
		assert: #(#abc) cormasHelper isTypeArray
		equals: true.
	self
		assert: #abc cormasHelper isTypeString
		equals: true.
	self
		assert: 123 cormasHelper isTypeNumber
		equals: true.
	self
		assert: 123 cormasHelper isTypeString
		equals: false.
	self
		assert: 'abc' cormasHelper nullValue
		equals: ''.
	self
		assert: #abc cormasHelper nullValue
		equals: #?.
	self
		assert: true cormasHelper nullValue
		equals: false.
	self
		assert: 123 cormasHelper nullValue
		equals: 0.
	Dialog warn: 'all tests success'
]
