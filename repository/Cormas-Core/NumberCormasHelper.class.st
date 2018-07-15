"
helper class for numbers
"
Class {
	#name : #NumberCormasHelper,
	#superclass : #Object,
	#category : 'Cormas-Core-Others'
}

{ #category : #helping }
NumberCormasHelper class >> isTypeNumber [
	"test if the helped objet is a Number"
	
	^true
]

{ #category : #helping }
NumberCormasHelper class >> nullValue [
	"return the nullValue for the type"
	
	^0
]

{ #category : #helping }
NumberCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^aDefaultValue asString
]
