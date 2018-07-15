"
helper class for nil
"
Class {
	#name : #UndefinedObjectCormasHelper,
	#superclass : #ObjectCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
UndefinedObjectCormasHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^#()
]

{ #category : #helping }
UndefinedObjectCormasHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^nil
]

{ #category : #helping }
UndefinedObjectCormasHelper class >> colorFrom: aColorOrSymbol [
	"return a color value for the argument"
	
	^nil
]

{ #category : #helping }
UndefinedObjectCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	^'nil'
]
