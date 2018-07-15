Class {
	#name : #CMUndefinedObjectHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMUndefinedObjectHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^#()
]

{ #category : #helping }
CMUndefinedObjectHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^nil
]

{ #category : #helping }
CMUndefinedObjectHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^nil
]

{ #category : #helping }
CMUndefinedObjectHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^'nil'
]
