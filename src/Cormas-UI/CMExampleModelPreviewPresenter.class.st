Class {
	#name : 'CMExampleModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'manifest',
		'modelPreview',
		'toolbar',
		'buttonBar',
		'signalUpdateBlock'
	],
	#category : 'Cormas-UI-ModelOpener',
	#package : 'Cormas-UI',
	#tag : 'ModelOpener'
}

{ #category : 'examples' }
CMExampleModelPreviewPresenter class >> example [
	<example>
	(self forManifest: ECECModelManifest) open
]

{ #category : 'instance creation' }
CMExampleModelPreviewPresenter class >> forManifest: aManifest [

	^ self on: aManifest
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
		CMModelLoaderUpdateCommand }.
		
	toolbarButtonCommands := CMModelLoaderCommand sortedSubclasses copyWithoutAll: largeButtonCommands.
	
	buttonBar items removeAll.
	toolbar removeAllItems.
	
	largeButtonCommands collect: [ :aCommandClass |
		command := aCommandClass forOwner: self.
			
		command isAvailable ifTrue: [
			buttonBar add: command button ] ].
	
	toolbarButtonCommands collect: [ :aCommandClass |
		command := aCommandClass forOwner: self.
			
		command isAvailable ifTrue: [
			toolbar addItemRight: command toolbarButton ] ].
]

{ #category : 'accessing' }
CMExampleModelPreviewPresenter >> manifest [

	^ manifest
]

{ #category : 'accessing - model' }
CMExampleModelPreviewPresenter >> setModelBeforeInitialization: aManifest [

	manifest := aManifest
]

{ #category : 'as yet unclassified' }
CMExampleModelPreviewPresenter >> signalUpdate [
	
	signalUpdateBlock value
]

{ #category : 'enumerating' }
CMExampleModelPreviewPresenter >> whenLoadedDo: aBlock [

	signalUpdateBlock := aBlock
]
