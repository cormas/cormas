Class {
	#name : #CMCollectionHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMCollectionHelper class >> elementsOf: collec1 equalElemenstOf: collec2 [
	
	^ collec1 hasEqualElements: collec2
]

{ #category : #'testing type' }
CMCollectionHelper class >> isTypeCollection [
	"test if the helped objet is a collection "
	
	^ true
]

{ #category : #helping }
CMCollectionHelper class >> isTypeCollectionNotChars [
	"test if the helped objet is a Collection and not a CharacterArray"
	
	^ true
]

{ #category : #helping }
CMCollectionHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	| defaultString coll |
	aDefaultValue isEmpty
		ifTrue: [ defaultString := String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: aDefaultValue class name asString; 
									nextPutAll: ' new' ] ]
		ifFalse: [ 
			defaultString := String empty.
			coll := aDefaultValue asString substrings asOrderedCollection.
			coll add: 'withAll:' beforeIndex: 2.
			coll do: [ : sub | defaultString := 
				String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: defaultString;
									nextPutAll: sub;
									nextPutAll: ' ' ] ] ].
	^ defaultString
]
