"
helper class for arrays
"
Class {
	#name : #ArrayCormasHelper,
	#superclass : #CollectionCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
ArrayCormasHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^anElementOrArray
]

{ #category : #helping }
ArrayCormasHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^anElementOrArray
]

{ #category : #helping }
ArrayCormasHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^true
]

{ #category : #helping }
ArrayCormasHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^true
]

{ #category : #helping }
ArrayCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^'Array withAll: ' , aDefaultValue asString
]
