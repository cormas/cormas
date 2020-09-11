"
helper class for collections
"
Class {
	#name : #CollectionCormasHelper,
	#superclass : #ObjectCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
CollectionCormasHelper class >> elementsOf: collec1 equalElemenstOf: collec2 [
	
	^ collec1 hasEqualElements: collec2
]

{ #category : #'testing type' }
CollectionCormasHelper class >> isTypeCollection [
	"test if the helped objet is a collection "
	
	^true
]

{ #category : #helping }
CollectionCormasHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^true
]

{ #category : #helping }
CollectionCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	| defaultString coll |
	aDefaultValue isEmpty
		ifTrue: [ defaultString := aDefaultValue class name asString , ' new' ]
		ifFalse: [ 
			defaultString := ''.
			coll := aDefaultValue asString substrings asOrderedCollection.
			coll add: 'withAll:' beforeIndex: 2.
			coll do: [ : sub | defaultString := defaultString , sub , ' ' ] ].
	^ defaultString
]
