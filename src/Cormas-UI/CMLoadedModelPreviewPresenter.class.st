Class {
	#name : 'CMLoadedModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'cormasModelClass',
		'modelPreview',
		'runSimulationButton',
		'runSimulationCommand',
		'toolbar'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMLoadedModelPreviewPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'instance creation' }
CMLoadedModelPreviewPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'accessing' }
CMLoadedModelPreviewPresenter >> cormasModelClass [

	^ cormasModelClass
]

{ #category : 'layout' }
CMLoadedModelPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: modelPreview;
		add: (SpBoxLayout newLeftToRight
			add: runSimulationButton width: 150;
			add: toolbar;
			yourself) expand: false;
		yourself
]

{ #category : 'examples' }
CMLoadedModelPreviewPresenter >> example [
	<script: 'self example'>
	
]

{ #category : 'initialization' }
CMLoadedModelPreviewPresenter >> initializePresenters [

	modelPreview := self instantiate: CMModelPreviewPresenter on: cormasModelClass.

	runSimulationCommand := CMModelOpenerSimulateCommand forOwner: self translator: translator.
	runSimulationButton := runSimulationCommand button.
	
	self initializeToolbar
]

{ #category : 'initialization' }
CMLoadedModelPreviewPresenter >> initializeToolbar [
	
	| command |
	
	toolbar := self newToolbar.
	toolbar beIcons.
	
	(CMModelOpenerCommand sortedSubclasses copyWithout: runSimulationCommand class)
		collect: [ :aCommandClass |
			command := aCommandClass forOwner: self translator: translator.
			toolbar addItemRight: command toolbarButton ]
]

{ #category : 'accessing - model' }
CMLoadedModelPreviewPresenter >> setModelBeforeInitialization: aCollection [

	cormasModelClass := aCollection first.
	translator := aCollection second
]
