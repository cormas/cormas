Class {
	#name : 'CMLoadedModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'cormasModelClass',
		'modelPreview',
		'runSimulationButton',
		'runSimulationCommand',
		'toolbar',
		'signalUpdateBlock'
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

{ #category : 'public-api' }
CMLoadedModelPreviewPresenter >> commands [

	^ CMModelOpenerCommand sortedSubclasses collect: [ :commandClass |
		commandClass forOwner: self translator: translator ]
]

{ #category : 'accessing' }
CMLoadedModelPreviewPresenter >> cormasModelClass [

	^ cormasModelClass
]

{ #category : 'layout' }
CMLoadedModelPreviewPresenter >> defaultLayout [

	| buttonsLayout |
	buttonsLayout := SpBoxLayout newLeftToRight.
	
	self commands
		select: #isBigButton
		thenDo: [ :command |
			buttonsLayout add: command button ].
		
	buttonsLayout add: toolbar.

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: modelPreview;
		add: buttonsLayout expand: false;
		yourself
]

{ #category : 'examples' }
CMLoadedModelPreviewPresenter >> example [
	<script: 'self example'>
	
]

{ #category : 'initialization' }
CMLoadedModelPreviewPresenter >> initializePresenters [

	signalUpdateBlock := [ "do nothing" ].
	
	modelPreview := self instantiate: CMModelPreviewPresenter on: cormasModelClass.

	runSimulationCommand := CMModelOpenerSimulateCommand forOwner: self translator: translator.
	runSimulationButton := runSimulationCommand button.
	
	self initializeToolbar
]

{ #category : 'initialization' }
CMLoadedModelPreviewPresenter >> initializeToolbar [
	
	toolbar := self newToolbar.
	toolbar beIcons.
	
	(self commands reject: #isBigButton) do: [ :command |
		command isAvailable ifTrue: [
			toolbar addItemRight: command toolbarButton ] ]
]

{ #category : 'accessing - model' }
CMLoadedModelPreviewPresenter >> setModelBeforeInitialization: aCollection [

	cormasModelClass := aCollection first.
	translator := aCollection second
]

{ #category : 'signalling' }
CMLoadedModelPreviewPresenter >> signalUpdate [
	
	signalUpdateBlock value
]

{ #category : 'enumerating' }
CMLoadedModelPreviewPresenter >> whenModelDeletedDo: aBlock [

	signalUpdateBlock := aBlock
]
