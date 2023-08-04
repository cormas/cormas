Class {
	#name : #CMTranslatorTest,
	#superclass : #TestCase,
	#instVars : [
		'selectors'
	],
	#category : #'Cormas-Tests-Helpers'
}

{ #category : #tests }
CMTranslatorTest >> doesTranslator: aTranslator returnStringsForAll: aCollectionOfSelectors [

	aCollectionOfSelectors do: [ :selector |
		self assert: (aTranslator perform: selector) isString ]
]

{ #category : #'as yet unclassified' }
CMTranslatorTest >> setUp [

	super setUp.
	selectors := CMAbstractTranslator selectors.
]

{ #category : #tests }
CMTranslatorTest >> testEnglishLanguageName [

	self assert: CMEnglishTranslator languageName equals: 'English'
]

{ #category : #tests }
CMTranslatorTest >> testEnglishTranslations [

	self doesTranslator: CMUkrainianTranslator new returnStringsForAll: selectors
]

{ #category : #tests }
CMTranslatorTest >> testFrenchLanguageName [

	self assert: CMFrenchTranslator languageName equals: 'French'
]

{ #category : #tests }
CMTranslatorTest >> testFrenchTranslations [

	self doesTranslator: CMFrenchTranslator new returnStringsForAll: selectors
]

{ #category : #tests }
CMTranslatorTest >> testNorwegianLanguageName [

	self assert: CMNorwegianTranslator languageName equals: 'Norwegian'
]

{ #category : #tests }
CMTranslatorTest >> testNorwegianTranslations [

	self doesTranslator: CMNorwegianTranslator new returnStringsForAll: selectors
]

{ #category : #tests }
CMTranslatorTest >> testPolishLanguageName [

	self assert: CMPolishTranslator languageName equals: 'Polish'
]

{ #category : #tests }
CMTranslatorTest >> testPolishTranslations [

	self doesTranslator: CMPolishTranslator new returnStringsForAll: selectors
]

{ #category : #tests }
CMTranslatorTest >> testSpanishLanguageName [

	self assert: CMSpanishTranslator languageName equals: 'Spanish'
]

{ #category : #tests }
CMTranslatorTest >> testSpanishTranslations [

	self doesTranslator: CMSpanishTranslator new returnStringsForAll: selectors
]

{ #category : #tests }
CMTranslatorTest >> testUkrainianLanguageName [

	self assert: CMUkrainianTranslator languageName equals: 'Ukrainian'
]

{ #category : #tests }
CMTranslatorTest >> testUkrainianTranslations [

	self doesTranslator: CMUkrainianTranslator new returnStringsForAll: selectors
]
