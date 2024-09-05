Class {
	#name : 'CMModelOpenerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelList',
		'browseButton',
		'openSimulationButton',
		'sensitivityAnalysisButton',
		'parametersTable'
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
CMModelOpenerPresenter class >> menu00RoassalOn: aBuilder [
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
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> connectPresenters [

	browseButton action: [ self openModelDesigner ].
	openSimulationButton action: [ self openSimulation ].
	sensitivityAnalysisButton action: [ self openSensitivityAnalysis ].
]

{ #category : 'layout' }
CMModelOpenerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: modelList;
		add: (SpBoxLayout newLeftToRight
			add: browseButton;
			add: openSimulationButton;
			add: sensitivityAnalysisButton;
			yourself) height: self class buttonHeight;
		yourself
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> findAvailableModels [

	^ CMAbstractModel allSubclasses
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializePresenters [

	translator := CMEnglishTranslator new.

	modelList := self newList
		items: self findAvailableModels;
		yourself.
		
	browseButton := self newButton
		label: 'Browse';
		icon: (self iconNamed: #smallSystemBrowser);
		yourself.
	
	openSimulationButton := self newButton
		label: 'Open Simulation';
		icon: CMIcons runIcon;
		yourself.
		
	sensitivityAnalysisButton := self newButton
		label: 'Sensitivity Analysis';
		icon: (self iconNamed: #testRunner);
		yourself.
]

{ #category : 'initialization' }
CMModelOpenerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Cormas Models';
		initialExtent: 450@400.
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> openModelDesigner [
		
	modelList selectedItem ifNotNil: [
		"(CMModelDesignerPresenter
			forModelClass: modelList selectedItem
			translator: translator) open."
		modelList selectedItem browse.
		self window close ].
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> openPresenter: aPresenter [

	modelList selectedItem ifNil: [ ^ self ].
		
	aPresenter open.
	aPresenter window centered.
	self window close
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> openSensitivityAnalysis [
		
	self openPresenter: (CMSensitivityAnalysisPresenter
		forModelClass: modelList selectedItem
		translator: translator)
]

{ #category : 'as yet unclassified' }
CMModelOpenerPresenter >> openSimulation [

	self openPresenter: (CMSimulationPresenter
		forModelClass: modelList selectedItem
		translator: translator)
]
