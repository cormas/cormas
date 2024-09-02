Class {
	#name : 'CMParametersEditorPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'editor'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
CMParametersEditorPresenterTest >> setUp [

	| translator |
	super setUp.
	
	translator := CMEnglishTranslator new.
	
	editor := CMParametersEditorPresenter
		forParameters: CMMockModel parameters
		translator: translator.
]

{ #category : 'tests' }
CMParametersEditorPresenterTest >> testConvertInputType [

	self assert: (editor convertInputType: '5') equals: 5.
	self assert: (editor convertInputType: '5.1') equals: 5.1.
	self assert: (editor convertInputType: '-0.5') equals: -0.5.
	self assert: (editor convertInputType: '') equals: nil.
	self assert: (editor convertInputType: 'hello') equals: 'hello'.
]
