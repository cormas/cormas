Class {
	#name : #CMArrayHelper,
	#superclass : #CMCollectionHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMArrayHelper class >> arrayFrom: anElementOrArray [
	"return an array for the argument"
	
	^ anElementOrArray
]

{ #category : #helping }
CMArrayHelper class >> arrayOrNilFrom: anElementOrArray [
	"return an array or a nil for the argument"
	
	^ anElementOrArray
]

{ #category : #helping }
CMArrayHelper class >> isTypeArray [
	"test if the helped objet is an Array (and not aString)"
	
	^ true
]

{ #category : #helping }
CMArrayHelper class >> isTypeArrayNotChars [
	"test if the helped objet is anArray and not a CharacterArray"
	
	^ true
]

{ #category : #helping }
CMArrayHelper class >> stringForDefaultValue: aDefaultValue [
	" return a string that is used to save a default value depending on its type "
	
	^ String streamContents: [ : stream |
			stream 
				nextPutAll: 'Array withAll: ';
				nextPutAll: aDefaultValue asString ]
]
