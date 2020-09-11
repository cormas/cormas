Class {
	#name : #CMBooleanHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMBooleanHelper class >> isTypeBoolean [
	"test if the helped objet is a Boolean"
	
	^ true
]

{ #category : #helping }
CMBooleanHelper class >> nullValue [
	"return the nullValue for the type"
	
	^ false
]

{ #category : #helping }
CMBooleanHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^ aDefaultValue asString
]
