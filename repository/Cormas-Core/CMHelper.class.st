"
Helpers are evil :)
"
Class {
	#name : #CMHelper,
	#superclass : #Object,
	#category : #'Cormas-Core-Helpers'
}

{ #category : #helping }
CMHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> colorFrom: aSymbolOrColorValue [
	"return a color value for the argument"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> elementsOf: collec1 equalElemenstOf: collec2 [
	"cheks if the elements of a collection or of a dictionnary are the same in both objects"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not a String)"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeEntity [
	"test if the helped object is an entity"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeEntityClass [
	"test if the helped class is Entity"
	
	^self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> isTypeNumber [
	"test if the helped objet is a Number"
	
	^self subclassResponsibility
]

{ #category : #'testing type' }
CMHelper class >> isTypeSet [
	"test if the helped objet is a set"
	
	^self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> nullValue [
	"return the nullValue for the type"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	self subclassResponsibility
]

{ #category : #helping }
CMHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument or the argument itself "
	
	self subclassResponsibility
]
