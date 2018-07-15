Class {
	#name : #CMDictionaryHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMDictionaryHelper class >> elementsOf: dico1 equalElemenstOf: dico2 [
	
	^ dico1 = dico2
]

{ #category : #'testing type' }
CMDictionaryHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^ true
]

{ #category : #helping }
CMDictionaryHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	aDefaultValue isEmpty
		ifTrue: [ ^ String 
						streamContents: [ : stream | 
								stream 
									nextPutAll: aDefaultValue class name asString;
									nextPutAll: ' new' ] ]
		ifFalse: [ self halt ]
]
