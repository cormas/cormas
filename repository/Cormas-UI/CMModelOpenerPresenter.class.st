Class {
	#name : 'CMModelOpenerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelList',
		'buttonBar',
		'buttons'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelOpenerPresenter class >> example [
	<example>
	
	self new open
]

{ #category : 'menu' }
CMModelOpenerPresenter class >> menu00CormasOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Cormas)
		label: 'Cormas';
		"icon: CMIcons cormasIcon;"
		help: 'Agent-based modeling and simulations';
		order: 2.
		
	(aBuilder item: #CormasModels)
		parent: #Cormas;
		label: 'Available models';
		help: 'Browse Cormas models that are installed on this image';
		action: [ self new open ];
		order: 1.
		
	(aBuilder item: #UpdateCormas)
		parent: #Cormas;
		label: 'Update Cormas';
		icon: (self iconNamed: #glamorousRestart);
		help: 'Pull the latest changes from Cormas repository on GitHub';
		action: [ self updateCormas ];
		order: 1.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter class >> updateCormas [

	| repo branch remote |
	
	repo := IceRepository repositories detect: [ :each | each name = 'cormas' ].
	branch := repo branch.
	remote := repo remotes detect: [ :each | each url = 'https://github.com/cormas/cormas.git' ].

	branch pullFrom: remote.
]

{ #category : 'layout' }
CMModelOpenerPresenter >> defaultLayout [

	| buttonsLayout |
	
	buttonsLayout := SpBoxLayout newLeftToRight.
	buttons do: [ :button | buttonsLayout add: button ].

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: modelList;
		add: buttonsLayout height: self class buttonHeight
		yourself.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> findAvailableModels [

	^ CMAbstractModel allSubclasses
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeButtons [
	
	| command |
	
	buttons := CMModelOpenerCommand subclasses collect: [ :aCommandClass |
		command := aCommandClass forOwner: self translator: translator.
		command button ]
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializePresenters [

	translator := CMEnglishTranslator new.

	modelList := self newList
		items: self findAvailableModels;
		yourself.
		
	buttonBar := self newButtonBar.
	self initializeButtons
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas Models';
		initialExtent: 450@400.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> selectedModelClass [

	^ modelList selectedItem
]
