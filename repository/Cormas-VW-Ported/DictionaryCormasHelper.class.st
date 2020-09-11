"
helper class for dictionaries

"
Class {
	#name : #DictionaryCormasHelper,
	#superclass : #Object,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
DictionaryCormasHelper class >> elementsOf: dico1 equalElemenstOf: dico2 [
	
	^dico1 contentsEquals: dico2
]

{ #category : #'testing type' }
DictionaryCormasHelper class >> isTypeDictionary [
	"test if the helped objet is a dictionary"
	
	^true
]

{ #category : #helping }
DictionaryCormasHelper class >> stringForDefaultValue: aDefaultValue [
	"return a string that is used to save a default value depending on its type"
	
	aDefaultValue isEmpty
		ifTrue: [^aDefaultValue class name asString , ' new']
		ifFalse: [self halt]
]
