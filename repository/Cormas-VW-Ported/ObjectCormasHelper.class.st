"
the helperClass for objects
"
Class {
	#name : #ObjectCormasHelper,
	#superclass : #CormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
ObjectCormasHelper class >> arrayFrom: anElementOrArray [
	" return an array for the argument "

	 ^ anElementOrArray isArray
			ifTrue: [ anElementOrArray ]
			ifFalse: [	Array with: anElementOrArray ]
]

{ #category : #helping }
ObjectCormasHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^ Array with: anElementOrArray
]

{ #category : #helping }
ObjectCormasHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^ Color colorFrom: aColorOrSymbol
]

{ #category : #helping }
ObjectCormasHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^ Color black
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeCollection [
	"test if the helped objet is a collection "
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeEntity [
	"test if the helped object is an entity"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeEntityClass [
	"test if the helped class is Entity"
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeNumber [
	"test if the helped objet is a Number"
	
	^false
]

{ #category : #'testing type' }
ObjectCormasHelper class >> isTypeSet [
	"test if the helped objet is a set"
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^false
]

{ #category : #helping }
ObjectCormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	^ nil
]

{ #category : #helping }
ObjectCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^ aDefaultValue asString
]

{ #category : #helping }
ObjectCormasHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^ anObjectOrMenuItemOrValueHolder
]
