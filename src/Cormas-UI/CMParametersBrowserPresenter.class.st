Class {
	#name : 'CMParametersBrowserPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'notebook'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMParametersBrowserPresenter class >> example [
	
	| model app |
	
	model := CMMockModel new.
	model initFixed.
	
	app := CMSimulationApplication new.
	app cormasModel: model.
	(app newPresenter: self) open
]

{ #category : 'accessing' }
CMParametersBrowserPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMParametersBrowserPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: 'Parameters' expand: false;
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
			on: { self cormasModel parameters . { self cormasModel } } ]).
		
	notebook addPage: (SpNotebookPage
		title: 'Class'
		provider: [ self
			instantiate: CMClassParametersPresenter
			on: self cormasModel ]).
		
	notebook addPage: (SpNotebookPage
		title: 'Selection'
		provider: [ self
			instantiate: CMSelectionParametersPresenter
			on: self cormasModel ]).
]
