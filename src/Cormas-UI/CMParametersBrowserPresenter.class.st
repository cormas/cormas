Class {
	#name : 'CMParametersBrowserPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
		'notebook'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMParametersBrowserPresenter class >> example [

	(self on: CMMockModel new) open
]

{ #category : 'layout' }
CMParametersBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: notebook;
		yourself.
]

{ #category : 'examples' }
CMParametersBrowserPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMParametersBrowserPresenter >> initializePresenters [

	notebook := self newNotebook.
	
	notebook addPage: (SpNotebookPage
		title: 'Model'
		provider: [ self
			instantiate: CMParametersPresenter
			on: { cormasModel parameters . { cormasModel } } ]).
		
	notebook addPage: (SpNotebookPage
		title: 'Class'
		provider: [ self
			instantiate: CMClassParametersPresenter
			on: cormasModel ]).
		
	notebook addPage: (SpNotebookPage
		title: 'Selection'
		provider: [ self
			instantiate: CMSelectionParametersPresenter
			on: cormasModel ]).
]

{ #category : 'accessing - model' }
CMParametersBrowserPresenter >> setModelBeforeInitialization: aModel [

	cormasModel := aModel 
]
