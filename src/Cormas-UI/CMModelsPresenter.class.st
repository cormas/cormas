Class {
	#name : 'CMModelsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelOpener',
		'exampleModelLoader',
		'notebook'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelsPresenter class >> example [
	<example>
	(self forTranslator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMModelsPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'layout' }
CMModelsPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 6;
		add: modelOpener;
		add: exampleModelLoader;
		yourself.
]

{ #category : 'examples' }
CMModelsPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMModelsPresenter >> initializePresenters [

	notebook := self newNotebook.
	
	modelOpener := self instantiate: CMModelOpenerPresenter.
	exampleModelLoader := self instantiate: CMExampleModelLoaderPresenter.
	
	notebook addPage: (SpNotebookPage
		title: 'Models in this image'
		icon: (self iconNamed: #smallOpen)
		provider: [ modelOpener ]).
		
	notebook addPage: (SpNotebookPage
		title: 'Example models library'
		icon: (self iconNamed: #box)
		provider: [ exampleModelLoader ]).
]

{ #category : 'initialization' }
CMModelsPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas Models';
		initialExtent: 450@400.
]

{ #category : 'accessing - model' }
CMModelsPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]
