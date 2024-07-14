Class {
	#name : #CMAbstractTranslator,
	#superclass : #Object,
	#category : #'Cormas-UI-Translator'
}

{ #category : #'as yet unclassified' }
CMAbstractTranslator class >> languageName [

	| className |
	className := self name.
	
	^ className copyFrom: 3 to: (className size - 10).
]

{ #category : #translations }
CMAbstractTranslator >> tCreateInstances [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tDisplayLegends [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tInspectModel [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tManipulateInstances [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPhoto [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tPoV [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tTools [

	self subclassResponsibility
]

{ #category : #translations }
CMAbstractTranslator >> tVideo [

	self subclassResponsibility
]
