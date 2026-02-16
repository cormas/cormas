Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'modelClass',
		'sidebar',
		'stopConditionPresenter',
		'simulationRunner',
		'simulation',
		'whenWindowIsClosedHooks'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel) open
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter class >> forModelClass: aClass [

	^ self on: aClass
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
		simulation ifNotNil: [ simulation stopWhen: stopConditionBlock ] ]
]

{ #category : 'layout' }
CMSimulationPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 10;
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
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	
	modelClass initializeParameters.
		
	stopConditionPresenter := self
		instantiate: CMStopConditionPresenter
		on: modelClass.
	
	self initializeFancyNotebook.

	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter.
]

{ #category : 'instance creation' }
CMSimulationPresenter >> initializeSimulationInit: anInitSelector control: aControlSelector [
"Purpose: instanciate a new modelClass with init & control selectors. Then initialize this simulation by performing #activeInitSelector.
Reset the currentTimeStep and the data. Set the randomSeed"
	simulation := CMSimulation for: modelClass.

	modelClass parameters do: [ :parameter |
		simulation initialParameterValues at: parameter put: parameter value ].

	simulation
		activeInitSelector: anInitSelector;
		activeControlSelector: aControlSelector.
		
	simulation stopWhen: stopConditionPresenter buildConditionBlock.
		
	self flag: 'TODO'.
	
	"modelInitializationSettings isFixRandomSeed ifTrue: [ 
		simulation randomSeed: modelInitializationSettings randomSeed.
		simulation shouldReleaseRandomSeedAfterInitialization:
			modelInitializationSettings isReleaseRandomSeedAfterInitialization ]."
		
	simulation initializeSimulation.
	simulationRunner simulation: simulation
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
	^ modelClass modelName, ' - Simulation'
]

{ #category : 'accessing - model' }
CMSimulationPresenter >> setModelBeforeInitialization: aClass [

	modelClass := aClass
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsRandomNumbers [
	<fancyNotebookPageOrder: 6>
	
	^ SpNotebookPage
		title: 'Random numbers'
		icon: (self iconNamed: #testRunner)
		provider: [ self
			instantiate: CMSimulationInitRandomPresenter
			on: modelClass ]
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsSimulationInitializer [
	<fancyNotebookPageOrder: 1>
	
	^ SpNotebookPage
		title: 'Initialize simulation'
		icon: (self iconNamed: #smallNew)
		provider: [ (self
			instantiate: CMSimulationInitializerPresenter
			on: modelClass)
			whenInitializeButtonClickedDo: [ :initSelector :controlSelector |
				self initializeSimulationInit: initSelector control: controlSelector ];
			yourself ]
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> settingsStopCondition [
	<fancyNotebookPageOrder: 3>
	
	^ SpNotebookPage
		title: 'Stop condition'
		icon: (self iconNamed: #accept)
		provider: [ stopConditionPresenter ]
]
