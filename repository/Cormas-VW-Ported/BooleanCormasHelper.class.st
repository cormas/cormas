"
helper class for booleans
"
Class {
	#name : #BooleanCormasHelper,
	#superclass : #ObjectCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
BooleanCormasHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^ true
]

{ #category : #helping }
BooleanCormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	^ false
]

{ #category : #helping }
BooleanCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^ aDefaultValue asString
]
