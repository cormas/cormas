Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'sidebar',
		'simulationInitializerPresenter',
		'stopConditionPresenter',
		'simulationRunner',
		'whenWindowIsClosedHooks'
	],
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'examples' }
CMSimulationPresenter class >> example [
	<example>
	
	CMSimulationApplication new
		cormasModel: CMMockModel new;
		run
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> collectFancyNotebookPages [

	| pragmas |
	
	"To make sure that we can still do it on subclasses"
	pragmas := Pragma
		allNamed: #fancyNotebookPageOrder:
		from: self class
		to: CMSimulationPresenter
		sortedByArgument: 1.

	^ pragmas collect: [ :pragma | self perform: pragma methodSelector ]
]

{ #category : 'compiling' }
CMSimulationPresenter >> compileBlock: aSourceCode [

	"Black magic"
	^ Smalltalk compiler
		environment: self class environment;
		source: aSourceCode;
		evaluate
]

{ #category : 'initialization' }
CMSimulationPresenter >> connectPresenters [
				
	stopConditionPresenter whenChangedDo: [ :stopConditionBlock |
		"Simulation will be nil if the stop condition is changed before
		simulation is initialized. This will happen in most cases. However,
		we still want to have the possibility to change the stop condition
		during the simulation. For example, if the simulation has completed
		and then you want to run it for 100 more steps"
		| simulation |
		simulation := self application simulation.
		simulation ifNotNil: [ simulation stopWhen: stopConditionBlock ] ]
]

{ #category : 'accessing' }
CMSimulationPresenter >> cormasModel [

	^ self application cormasModel
]

{ #category : 'layout' }
CMSimulationPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 10;
		borderWidth: 2;
		add: sidebar expand: false;
		add: simulationRunner;
		yourself
]

{ #category : 'examples' }
CMSimulationPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSimulationPresenter >> initialize [

	whenWindowIsClosedHooks := OrderedCollection new.
	"Call super after initializing the hooks variable"
	super initialize
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeFancyNotebook [
		
	| pages |
	sidebar := self instantiate: CMDockableSidebar.
	
	pages := self collectFancyNotebookPages.
	pages do: [ :page | sidebar addPage: page ]. 
	
	sidebar
		addButtonIcon: (self iconNamed: #smallSystemBrowser)
		help: 'Browse'
		action: [ self cormasModel browse ]
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
		
	stopConditionPresenter := self instantiate: CMStopConditionPresenter.
	
	simulationInitializerPresenter := (self instantiate: CMSimulationInitializerPresenter)
		whenInitializeButtonClickedDo: [ :initSelector :controlSelector |
			self
				initializeSimulationInit: initSelector
				control: controlSelector ];
		yourself.
	
	self initializeFancyNotebook.

	simulationRunner := self instantiate: CMSimulationRunnerPresenter.
]

{ #category : 'instance creation' }
CMSimulationPresenter >> initializeSimulationInit: anInitSelector control: aControlSelector [
"Purpose: instanciate a new modelClass with init & control selectors. Then initialize this simulation by performing #activeInitSelector.
Reset the currentTimeStep and the data. Set the randomSeed"

	| simulation parameters |
	
	"Save parameters from previous simulation to copy their values and start with the same values
	in the new simulation. This is important if we want to set some parameters before initialization"
	parameters := self cormasModel allParameters.

	simulation := CMSimulation for: self cormasModel.
	self application simulation: simulation.

	simulation
		activeInitSelector: anInitSelector;
		activeControlSelector: aControlSelector.
		
	simulation stopWhen: stopConditionPresenter buildConditionBlock.
		
	simulationInitializerPresenter applyRandomNumberGeneratorSettings.
	
	simulation initializeSimulation.
	simulationRunner updateWithSimulation.
	simulationInitializerPresenter updatePresenter
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: self presenterWindowTitle;
		initialExtent: 1000@600;
		whenResizingDo: [ simulationRunner fitDiagram ];
		whenClosedDo: [ whenWindowIsClosedHooks do: #value ]
]

{ #category : 'initialization' }
CMSimulationPresenter >> presenterWindowTitle [
	"We extract it here to allow customization in subclasses"
	^ self cormasModel class modelName, ' - Simulation'
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsParameters [
	<fancyNotebookPageOrder: 5>
	
	^ SpNotebookPage
		title: 'Parameters'
		icon: (self iconNamed: #configuration)
		provider: [ self instantiate: CMParametersBrowserPresenter ]
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsSimulationInitializer [
	<fancyNotebookPageOrder: 1>
	
	^ SpNotebookPage
		title: 'Initialize simulation'
		icon: (self iconNamed: #smallNew)
		provider: [ simulationInitializerPresenter ]
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsStopCondition [
	<fancyNotebookPageOrder: 3>
	
	^ SpNotebookPage
		title: 'Stop condition'
		icon: (self iconNamed: #accept)
		provider: [ stopConditionPresenter ]
]
