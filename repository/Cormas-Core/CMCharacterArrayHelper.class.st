Class {
	#name : #CMCharacterArrayHelper,
	#superclass : #CMArrayHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMCharacterArrayHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^false
]

{ #category : #'testing type' }
CMCharacterArrayHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^false
]

{ #category : #helping }
CMCharacterArrayHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^false
]

{ #category : #helping }
CMCharacterArrayHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^true
]
