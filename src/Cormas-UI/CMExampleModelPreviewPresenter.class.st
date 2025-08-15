Class {
	#name : 'CMExampleModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'manifest',
		'modelPreview',
		'toolbar',
		'buttonBar',
		'signalUpdateBlock'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMExampleModelPreviewPresenter class >> example [
	<example>
	(self forManifest: ECECModelManifest translator: CMEnglishTranslator new) open
]

{ #category : 'instance creation' }
CMExampleModelPreviewPresenter class >> forManifest: aManifest translator: aTranslator [

	^ self on: { aManifest . aTranslator }
]

{ #category : 'layout' }
CMExampleModelPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: modelPreview;
		add: (SpBoxLayout newLeftToRight
			add: buttonBar width: 200;
			add: toolbar;
			yourself) expand: false;
		yourself
]

{ #category : 'examples' }
CMExampleModelPreviewPresenter >> example [
	<script: 'self example'>
	
]

{ #category : 'initialization' }
CMExampleModelPreviewPresenter >> initializePresenters [

	signalUpdateBlock := [ "do nothing" ].

	modelPreview := self instantiate: CMModelPreviewPresenter on: manifest.
	
	buttonBar := self newButtonBar.
	buttonBar placeAtStart.
	
	toolbar := self newToolbar.
	toolbar beIcons.
	self initializeToolbar
]

{ #category : 'initialization' }
CMExampleModelPreviewPresenter >> initializeToolbar [
	
	| largeButtonCommands toolbarButtonCommands command |
	
	largeButtonCommands := {
		CMModelLoaderLoadCommand .
		CMModelLoaderUpdateCommand .
		CMModelLoaderDeleteCommand }.
		
	toolbarButtonCommands := CMModelLoaderCommand sortedSubclasses copyWithoutAll: largeButtonCommands.
	
	buttonBar items removeAll.
	toolbar removeAllItems.
	
	largeButtonCommands collect: [ :aCommandClass |
		command := aCommandClass forOwner: self translator: translator.
			
		command isAvailable ifTrue: [
			buttonBar add: command button ] ].
	
	toolbarButtonCommands collect: [ :aCommandClass |
		command := aCommandClass forOwner: self translator: translator.
			
		command isAvailable ifTrue: [
			toolbar addItemRight: command toolbarButton ] ].
]

{ #category : 'accessing' }
CMExampleModelPreviewPresenter >> manifest [

	^ manifest
]

{ #category : 'as yet unclassified' }
CMExampleModelPreviewPresenter >> onModelLoaded [

	"do nothing"
]

{ #category : 'accessing - model' }
CMExampleModelPreviewPresenter >> setModelBeforeInitialization: aCollection [

	manifest := aCollection first.
	translator := aCollection second
]

{ #category : 'as yet unclassified' }
CMExampleModelPreviewPresenter >> signalUpdate [
	
	signalUpdateBlock value
]

{ #category : 'enumerating' }
CMExampleModelPreviewPresenter >> whenLoadedOrUnloadedDo: aBlock [

	signalUpdateBlock := aBlock
]
