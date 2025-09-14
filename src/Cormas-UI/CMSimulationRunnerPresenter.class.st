Class {
	#name : 'CMSimulationRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'simulation',
		'simulationControls',
		'notebook',
		'spacePresenter',
		'dataTable',
		'chartPresenter',
		'spacePage',
		'dataPage',
		'chartsPage',
		'shouldPause'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> example [
	<example>
	| simulation |

	simulation := (CMSimulation for: CMMockModel)
		randomSeed: 41;
		activeInitSelector: #initFixed;
		activeControlSelector: #step:;
		initializeSimulation;
		yourself.

	(self forTranslator: CMEnglishTranslator new)
		simulation: simulation;
		open
]

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> exampleEmpty [
	<example>
	(self forTranslator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter class >> openForSimulation: aSimulation withTranslator: aTranslator [

	(self forTranslator: aTranslator)
		simulation: aSimulation;
		open
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInNotRunningMode [

	(owner isNotNil and: [ owner isWindowPresenter not ])
		ifTrue: [ owner beInNotRunningMode ]
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInRunningMode [

	(owner isNotNil and: [ owner isWindowPresenter not ])
		ifTrue: [ owner beInRunningMode ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> connectPresenters [
	
	notebook whenSelectedPageChangedDo: [ :page |
		self updateSelectedNotebookPage ].
]

{ #category : 'specs' }
CMSimulationRunnerPresenter >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: simulationControls height: 90;
		add: notebook;
		yourself
]

{ #category : 'settings' }
CMSimulationRunnerPresenter >> finalTimeStep [
	
	^ simulationControls finalTimeStep
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> fitDiagram [

	simulation ifNil: [ ^ self ].
	spacePresenter fitDiagram.
]

{ #category : 'testing' }
CMSimulationRunnerPresenter >> hasSimulation [
	
	^ simulation isNotNil
]

{ #category : 'testing' }
CMSimulationRunnerPresenter >> hasSimulationData [
	"Answer true if there is a simulation data that could be lost if presenter is closed"
	
	^ simulation isNotNil and: [ simulation data isNotEmpty ]
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> hideSettings [

	simulationControls hide.
	owner hideInitializationSettings.
	self update.
	self fitDiagram
]

{ #category : 'public' }
CMSimulationRunnerPresenter >> initializeCharts [

	chartPresenter := self
		instantiate: CMChartPresenter
		on: { simulation . translator } 
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeDataTable [

	dataTable := self instantiate: CMDataPresenter on: translator.
	dataTable columnNames: (simulation activeProbes collect: #name)
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeNotebookPages [
	"Purpose: Set the Notebook Pages:
	grid = SpacePresenter, 
	data table = initializeDataTable,
	charts = diagrams"

	self initializeSpacePresenter.
	self initializeDataTable.
	self initializeCharts.

	notebook removeAll.

	spacePage := SpNotebookPage
		             title: translator tSpace
		             provider: [ spacePresenter ].
	"icon: (self iconNamed: #paint)"

	dataPage := SpNotebookPage
		            title: translator tData
		            provider: [ dataTable ].
	"icon: (self iconNamed: #database)"

	chartsPage := SpNotebookPage
		              title: translator tCharts
		              provider: [ chartPresenter ].
	"icon: CMIcons chartIcon"

	notebook addPage: spacePage.
	notebook addPage: dataPage.
	notebook addPage: chartsPage.

	notebook addPage: (SpNotebookPage
			 title: translator tInspector
			 provider: [ StInspectorPresenter onObject: simulation ]).
	"icon: (self iconNamed: #smallInspectIt)"

	notebook selectPageIndex: 1
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializePresenters [

	shouldPause := false.
	
	simulationControls := self
		instantiate: CMSimulationControlsPresenter
		on: translator.
		
	notebook := self newNotebook.

	"A hack to overcome an issue with notebook pages that were added to an empty notebook not signalling the event when they are selected"
	notebook addPage: (SpNotebookPage
		title: 'Empty'
		provider: [ self newLabel ]).
	
	"By default this page is disabled. It will be enabled when the simulation: setter is called"
	self enabled: false
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeSpacePresenter [
	"Purpose: Instanciates a new SpacePresenter for the given simulation"
	spacePresenter := self instantiate: CMSpacePresenter on: simulation cormasModel
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Simulation Runner';
		initialExtent: 1000@600;
		whenResizingDo: [ self fitDiagram ].
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeWithSimulation [
"Purpose: set the final time step, then initialize the Notebook Pages (grid, diagrams,...)"
	self enabled: true.
	simulationControls finalTimeStep: simulation finalTimeStep.
	self initializeNotebookPages.
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> runSimulationUntilEnd [

	simulationControls beInRunningMode.
	
	[ [ [ simulation currentTimeStep < simulation finalTimeStep and: [ shouldPause not ] ] whileTrue: [
		(simulationControls displayEvery min: (simulation finalTimeStep - simulation currentTimeStep))
			timesRepeat: [ simulation runStep ].
			
		[ self updateAfterStep ] onErrorDo: [ :error |
			"An ugly hack to silence Roassal errors that are caused by parallel execution"
			error asString = '#intersect: was sent to nil'
				ifFalse: [ error signal ] ].
		
		(Delay forMilliseconds: simulationControls speedInMilliseconds) wait ]
	] ensure: [
		shouldPause := false.
		simulationControls beInNotRunningMode ].
 
	shouldPause := false.
	simulationControls beInNotRunningMode ] fork.
]

{ #category : 'accessing - model' }
CMSimulationRunnerPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> shouldPause: aBoolean [

	shouldPause := aBoolean
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> showSettings [

	simulationControls show.
	owner showInitializationSettings.
	self update.
	self fitDiagram
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> simulation [

	^ simulation 
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> simulation: aSimulation [

"Purpose: registers aSimulation, then initialize the Notebook Pages (grid, diagrams,...)"

	simulation := aSimulation.
	self initializeWithSimulation
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> speedDropListItems [

	^ {
		  translator tSpeed10xSlower.
		  translator tSpeed5xSlower.
		  translator tSpeed2xSlower.
		  translator tSpeedNormal.
		  translator tSpeed2xFaster.
		  translator tSpeed5xFaster.
		  translator tSpeed10xFaster }
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> stepSimulation [

	simulation runStep.
	self updateAfterStep.
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> translator: anObject [

	translator := anObject
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateAfterStep [

	simulationControls currentTimeStep: simulation currentTimeStep. 
	self updateSelectedNotebookPage.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateChart [

	chartPresenter updateCharts.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateDataTable [

	dataTable showData: simulation data
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> updateFinalTimeStep: aNumber [

	simulation finalTimeStep: aNumber
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateSelectedNotebookPage [
	"Only update the page that is currently being displayed. This makes execution much faster because other pages (chart, space, data table) will not be updated when they are not displayed"
	
	notebook selectedPage ifNil: [ ^ self ].
	
	notebook selectedPage = spacePage ifTrue: [ self updateSpace ].
	notebook selectedPage = dataPage ifTrue: [ self updateDataTable ].
	notebook selectedPage = chartsPage ifTrue: [ self updateChart ]
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateSpace [

	spacePresenter updateDiagram
]
