Class {
	#name : 'CMModelPreviewPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'cormasModelClass',
		'screenshot',
		'modelDescription',
		'runSimulationButton',
		'runSimulationCommand',
		'toolbar'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelPreviewPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'instance creation' }
CMModelPreviewPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'as yet unclassified' }
CMModelPreviewPresenter class >> screenshotSize [
	"Width and height of screenshot in pixels"
	^ 400
]

{ #category : 'accessing' }
CMModelPreviewPresenter >> cormasModelClass [

	^ cormasModelClass
]

{ #category : 'layout' }
CMModelPreviewPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			hAlignCenter;
			add: (SpBoxLayout newTopToBottom
				add: screenshot expand: false;
				add: modelDescription;
				yourself) width: self class screenshotSize;
			yourself);
		add: (SpBoxLayout newLeftToRight
			add: runSimulationButton width: 150;
			add: toolbar;
			yourself) expand: false;
		yourself
]

{ #category : 'examples' }
CMModelPreviewPresenter >> example [
	<script: 'self example'>
	
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializePresenters [

	screenshot := self newImage
		"autoScale: true;"
		yourself.

	modelDescription := self instantiate: MicrodownPresenter.
	
	runSimulationCommand := CMModelOpenerSimulateCommand forOwner: self translator: translator.
	runSimulationButton := runSimulationCommand button.
	
	self initializeToolbar.
	self initializeWithModelClass.
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializeToolbar [
	
	| command |
	
	toolbar := self newToolbar.
	toolbar beIcons.
	
	(CMModelOpenerCommand sortedSubclasses copyWithout: runSimulationCommand class)
		collect: [ :aCommandClass |
			command := aCommandClass forOwner: self translator: translator.
			toolbar addItemRight: command toolbarButton ]
]

{ #category : 'initialization' }
CMModelPreviewPresenter >> initializeWithModelClass [

	| image descriptionWithTitle |

	image := cormasModelClass screenshot
		scaledToSize: self class screenshotSize @ self class screenshotSize.
	
	screenshot image: image.
	
	descriptionWithTitle := String streamContents: [ :stream |
		stream
			nextPut: $#;
			nextPutAll: cormasModelClass modelName;
			cr;
			nextPutAll: cormasModelClass aboutThisModel ].
		
	modelDescription documentFromString: descriptionWithTitle
]

{ #category : 'accessing - model' }
CMModelPreviewPresenter >> setModelBeforeInitialization: aCollection [

	cormasModelClass := aCollection first.
	translator := aCollection second
]
