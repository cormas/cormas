Class {
	#name : 'CMModelDesignerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'toolbar',
		'openSimulationButton',
		'notebook'
	],
	#category : 'Cormas-UI-ModelDesigner',
	#package : 'Cormas-UI-ModelDesigner'
}

{ #category : 'examples' }
CMModelDesignerPresenter class >> example [
	<example>
	
	(self forModelClass: ECECModel translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> addAboutModelNotebookPage [

	notebook addPage: (SpNotebookPage
		title: 'About'
		icon: (self iconNamed: #glamorousBrowse)
		provider: [
			self
				instantiate: CMModelDesignerAboutPresenter
				on: { modelClass . translator } ])
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> addClassesNotebookPages [

	| classes |
	classes := modelClass package classes asOrderedCollection.
	classes := classes copyWithout: modelClass.
	classes := self sortedClasses: classes.

	classes do: [ :aClass |
		notebook addPage: ((SpNotebookPage 
			title: (aClass name withoutPrefix: modelClass prefix)
			icon: (self iconForClass: aClass)
			provider: [ self instantiate: CMModelDesignerEntityClassPresenter on: { aClass . modelClass prefix . translator } ])
			beCloseable;
			yourself) ].
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> addModelNotebookPage [

	notebook addPage: ((SpNotebookPage 
		title: 'Model'
		icon: (self iconForClass: modelClass)
		provider: [ self instantiate: CMModelDesignerModelPresenter on: { modelClass . modelClass prefix . translator } ])
		yourself)
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> addNewClassNotebookPage [

	notebook addPage: (SpNotebookPage
		title: ''
		icon: (self iconNamed: #smallAdd)
		provider: [
			self
				instantiate: CMModelDesignerNewClassPresenter
				on: { modelClass . modelClass prefix . translator } ])
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> classRank: aClass [
	"A number that is used to sort class pages in the notebook"
		
	"Make sure that subclasses appear after superclasses"
	(aClass superclass package = modelClass package) ifTrue: [ 
		^ (self classRank: aClass superclass) + 0.001 ].
	
	aClass isCormasCellClass ifTrue: [ ^ 1 ].
	aClass isCormasAgentClass ifTrue: [ ^ 2 ].
	^ 3
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> confirmDeleteClassNamed: aString [

	| aClass |
	aClass := self class environment at: (modelClass prefix, aString) asSymbol.

	SpConfirmDialog new
		  title: 'Warning!';
		  label: (String streamContents: [ :stream |
				stream 
					nextPutAll: 'Are you sure you want to delete class ';
					nextPutAll: aString;
					nextPut: $? ]);
		  acceptLabel: 'Yes';
		  cancelLabel: 'No';
		  onAccept: [ self deleteClass: aClass ];
		  openModal.
		
		self updateNotebookPages.
]

{ #category : 'initialization' }
CMModelDesignerPresenter >> connectPresenters [

	openSimulationButton action: [ 
		(CMSimulationPresenter
			forModelClass: modelClass
			translator: translator)
			open ]
]

{ #category : 'layout' }
CMModelDesignerPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom
		add: toolbar expand: false;
		add: notebook;
		yourself
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> deleteClass: aClass [

	aClass removeFromSystem
]

{ #category : 'examples' }
CMModelDesignerPresenter >> example [

	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> iconForClass: aClass [
	
	aClass isCormasModelClass ifTrue: [ ^ self iconNamed: #home ].
	aClass isCormasCellClass ifTrue: [ ^ self iconNamed: #paint ].
	aClass isCormasAgentClass ifTrue: [ ^ self iconNamed: #user ].
	
	^ self iconNamed: #class
]

{ #category : 'initialization' }
CMModelDesignerPresenter >> initializePresenters [
	
	openSimulationButton := self newToolbarButton
		label: 'Simulation';
		icon: CMIcons runIcon;
		yourself.

	toolbar := self newToolbar
		add: openSimulationButton;
		yourself.

	notebook := self newNotebook
		whenPageRemovedDo: [ :page |
			self confirmDeleteClassNamed: page title ].
	
	self updateNotebookPages
]

{ #category : 'initialization' }
CMModelDesignerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: ('Model Designer -- ', modelClass name);
		initialExtent: 1000@600
]

{ #category : 'accessing - model' }
CMModelDesignerPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> sortedClasses: aCollection [

	^ (aCollection
		sorted: [ :a :b | a name > b name ])
		sorted: [ :a :b | (self classRank: a) < (self classRank: b) ]
]

{ #category : 'as yet unclassified' }
CMModelDesignerPresenter >> updateNotebookPages [

	notebook pages removeAll.
	
	self addAboutModelNotebookPage.
	self addModelNotebookPage.
	self addClassesNotebookPages.
	self addNewClassNotebookPage
]
