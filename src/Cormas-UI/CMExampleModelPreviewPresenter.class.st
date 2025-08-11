Class {
	#name : 'CMExampleModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'manifest',
		'modelPreview',
		'loadButton',
		'loadCommand',
		'toolbar'
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
			add: loadButton width: 150;
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

	modelPreview := self instantiate: CMModelPreviewPresenter on: manifest.

	loadCommand := CMModelLoaderLoadCommand forOwner: self translator: translator.
	loadButton := loadCommand button.
	
	self initializeToolbar
]

{ #category : 'initialization' }
CMExampleModelPreviewPresenter >> initializeToolbar [
	
	| command |
	
	toolbar := self newToolbar.
	toolbar beIcons.
	
	(CMModelLoaderCommand sortedSubclasses copyWithout: loadCommand class)
		collect: [ :aCommandClass |
			command := aCommandClass forOwner: self translator: translator.
			toolbar addItemRight: command toolbarButton ]
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
