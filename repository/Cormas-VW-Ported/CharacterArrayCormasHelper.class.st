Class {
	#name : #CharacterArrayCormasHelper,
	#superclass : #ArrayCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
CharacterArrayCormasHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^false
]

{ #category : #'testing type' }
CharacterArrayCormasHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^false
]

{ #category : #helping }
CharacterArrayCormasHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^false
]

{ #category : #helping }
CharacterArrayCormasHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^true
]
