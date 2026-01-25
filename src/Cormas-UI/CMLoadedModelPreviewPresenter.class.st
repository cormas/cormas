Class {
	#name : 'CMLoadedModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
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
	(self forModelClass: CMMockModel) open
]

{ #category : 'instance creation' }
CMLoadedModelPreviewPresenter class >> forModelClass: aClass [

	^ self on: aClass
]

{ #category : 'public-api' }
CMLoadedModelPreviewPresenter >> commands [

	^ CMModelOpenerCommand sortedSubclasses collect: [ :commandClass |
		commandClass forOwner: self ]
]

{ #category : 'accessing' }
CMLoadedModelPreviewPresenter >> cormasModelClass [

	^ cormasModelClass
]

{ #category : 'layout' }
CMLoadedModelPreviewPresenter >> defaultLayout [

	| buttonsLayout |
	buttonsLayout := SpBoxLayout newLeftToRight
		add: runSimulationButton;
		add: toolbar;
		yourself.

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

	runSimulationButton := self newButton
		label: 'Simulate';
		icon: CMIcons runIcon;
		action: [
			| presenter |
			presenter := CMSimulationPresenter
				forModelClass: cormasModelClass.
			presenter open.
			presenter window centered ].
	
	self initializeToolbar
]

{ #category : 'initialization' }
CMLoadedModelPreviewPresenter >> initializeToolbar [
	
	toolbar := self newToolbar.
	toolbar beIcons.
	self commands do: [ :command |
		command isAvailable ifTrue: [ toolbar addItemRight: command toolbarButton ] ]
]

{ #category : 'accessing - model' }
CMLoadedModelPreviewPresenter >> setModelBeforeInitialization: aClass [

	cormasModelClass := aClass
]

{ #category : 'signalling' }
CMLoadedModelPreviewPresenter >> signalUpdate [
	
	signalUpdateBlock value
]

{ #category : 'enumerating' }
CMLoadedModelPreviewPresenter >> whenModelDeletedDo: aBlock [

	signalUpdateBlock := aBlock
]
