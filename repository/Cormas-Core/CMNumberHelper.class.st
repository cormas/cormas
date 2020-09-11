Class {
	#name : #CMNumberHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMNumberHelper class >> isTypeNumber [
	"test if the helped objet is a Number"

	^true
]

{ #category : #helping }
CMNumberHelper class >> nullValue [
	"return the nullValue for the type"

	^0
]

{ #category : #helping }
CMNumberHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"

	^aDefaultValue asString
]
