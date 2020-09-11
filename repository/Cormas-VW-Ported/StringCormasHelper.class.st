"
the helper class for strings
"
Class {
	#name : #StringCormasHelper,
	#superclass : #CharacterArrayCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
StringCormasHelper class >> isTypeString [
	"test if the helped objet is a String or Symbol"
	
	^true
]

{ #category : #helping }
StringCormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	^''
]

{ #category : #helping }
StringCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^aDefaultValue printString
]
