Class {
	#name : #CMObjectHelper,
	#superclass : #CMHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMObjectHelper class >> arrayFrom: anElementOrArray [
	" return an array for the argument "

	 ^ anElementOrArray isArray
			ifTrue: [ anElementOrArray ]
			ifFalse: [	Array with: anElementOrArray ]
]

{ #category : #helping }
CMObjectHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^ Array with: anElementOrArray
]

{ #category : #helping }
CMObjectHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^ Color colorFrom: aColorOrSymbol
]

{ #category : #helping }
CMObjectHelper class >> colorOrBlackFrom: aColorValueOrElse [
	"return either the argument if it is a colorValue or a black colorValue"
	
	^ Color black
]

{ #category : #helping }
CMObjectHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeCollection [
	"test if the helped objet is a collection "
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeColorValue [
	"test if the helped objet is a ColorValue"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeEntity [
	"test if the helped object is an entity"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeEntityClass [
	"test if the helped class is Entity"
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> isTypeNumber [
	"test if the helped objet is a Number"
	
	^false
]

{ #category : #'testing type' }
CMObjectHelper class >> isTypeSet [
	"test if the helped objet is a set"
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> isTypeSymbol [
	"test if the helped objet is a Symbol"
	
	^false
]

{ #category : #helping }
CMObjectHelper class >> nullValue [
	"return the nullValue for the type"
	
	^ nil
]

{ #category : #helping }
CMObjectHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^ aDefaultValue asString
]

{ #category : #helping }
CMObjectHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^ anObjectOrMenuItemOrValueHolder
]
