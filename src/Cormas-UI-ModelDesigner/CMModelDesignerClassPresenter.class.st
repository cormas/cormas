Class {
	#name : 'CMModelDesignerClassPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'prefix',
		'aClass',
		'nameInput',
		'superclassDroplist',
		'parameterList',
		'sourceCodeNotebook'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'as yet unclassified' }
CMModelDesignerClassPresenter class >> forClass: aClass prefix: aString translator: aTranslator [

	^ self on: { aClass . aString . aTranslator }
]

{ #category : 'initialization' }
CMModelDesignerClassPresenter >> connectPresenters [

	"do nothing"
]

{ #category : 'initialization' }
CMModelDesignerClassPresenter >> initializePresenters [

	nameInput := self newTextInput
		text: (aClass name withoutPrefix: prefix);
		yourself.

	superclassDroplist := self newDropList
		items: { aClass superclass };
		yourself.
		
	parameterList := self
		instantiate: CMModelDesignerParametersPresenter
		on: { 'Parameters' . aClass . translator }. 
		
	sourceCodeNotebook := self newNotebook
]

{ #category : 'accessing - model' }
CMModelDesignerClassPresenter >> setModelBeforeInitialization: aCollection [

	aClass := aCollection first.
	prefix := aCollection second.
	translator := aCollection third
]

{ #category : 'as yet unclassified' }
CMModelDesignerClassPresenter >> showSourceCode: aMethod [

	| page |
	
	page := (SpNotebookPage
		title: aMethod selector asString
		icon: (self iconNamed: #scriptManager)
		provider: [ self newCode
			beForMethod: aMethod;
			text: aMethod sourceCode;
			yourself ])
		beCloseable;
		yourself.

	sourceCodeNotebook pages removeAll.
	sourceCodeNotebook addPage: page.
	sourceCodeNotebook selectPage: page
]
