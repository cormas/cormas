Class {
	#name : 'CMSimulationRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'runButton',
		'stepButton',
		'currentTimeStepLabel',
		'speedDropList',
		'displayEveryNumberPresenter',
		'notebook',
		'spacePresenter',
		'dataTable',
		'chartPresenter',
		'spacePage',
		'dataPage',
		'chartsPage'
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

	self openForSimulation: simulation
]

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> exampleEmpty [
	<example>
	self new open
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter class >> openForSimulation: aSimulation [

	self new
		simulation: aSimulation;
		open
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInPauseMode [

	self initializeRunButtonWithRunAction.
	stepButton enabled: true
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> beInRunningMode [

	self initializeRunButtonWithPauseAction.
	stepButton enabled: false
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> connectPresenters [

	stepButton action: [ self stepSimulation ].

	self initializeRunButtonWithRunAction.
	
	speedDropList whenSelectedItemChangedDo: [ :item | self setSimulationStepDelay ].
	
	notebook whenSelectedPageChangedDo: [ :page |
		self updateSelectedNotebookPage ].
]

{ #category : 'specs' }
CMSimulationRunnerPresenter >> defaultLayout [

	| simulationControlsLayout |
	
	simulationControlsLayout := SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 3;
				   add: 'Step' expand: false;
				   add: stepButton;
				   yourself)
		  width: 60;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 3;
				   add: 'Run' expand: false;
				   add: runButton;
				   yourself)
		  width: 60;
		  add: SpNullPresenter new width: 10;
		  add: (SpBoxLayout newTopToBottom
				vAlignCenter;
				add: SpNullPresenter new height: self class labelHeight;
				add: currentTimeStepLabel;
				yourself) width: 100;
		  add: SpNullPresenter new;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 3;
				   add: 'Speed' expand: false;
				   add: speedDropList;
				   yourself)
		  height: 52;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 3;
				   add: 'Display every' expand: false;
				   add: displayEveryNumberPresenter;
				   yourself)
		  expand: false;
		  yourself.

	^ SpBoxLayout newTopToBottom
		  spacing: 10;
		  add: simulationControlsLayout expand: false;
		  add: notebook;
		  yourself
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> displayCurrentTimeStep [

	currentTimeStepLabel label: ('Step: ', simulation currentTimeStep asString)
]

{ #category : 'examples' }
CMSimulationRunnerPresenter >> example [
	<script: 'self example'>
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

	self flag: 'TODO'.
	"simulationControls hide."
	
	self flag: 'TODO'.
	"owner hideInitializationSettings."
	self update.
	self fitDiagram
]

{ #category : 'public' }
CMSimulationRunnerPresenter >> initializeCharts [

	chartPresenter := self
		instantiate: CMChartPresenter
		on: simulation 
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeDataTable [

	dataTable := self instantiate: CMDataPresenter.
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
		             title: 'Space'
		             provider: [ spacePresenter ].
	"icon: (self iconNamed: #paint)"

	dataPage := SpNotebookPage
		            title: 'Data'
		            provider: [ dataTable ].
	"icon: (self iconNamed: #database)"

	chartsPage := SpNotebookPage
		              title: 'Charts'
		              provider: [ chartPresenter ].
	"icon: CMIcons chartIcon"

	notebook addPage: spacePage.
	notebook addPage: dataPage.
	notebook addPage: chartsPage.

	notebook addPage: (SpNotebookPage
			 title: 'Inspector'
			 provider: [ StInspectorPresenter onObject: simulation ]).
	"icon: (self iconNamed: #smallInspectIt)"

	notebook selectPageIndex: 1
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializePresenters [

	runButton := self newButton
		             help: 'Run the simulation to the end';
		             yourself.

	stepButton := self newButton
		              icon: CMIcons stepIcon;
		              help: 'Run the simulation just one step forward';
		              yourself.
		
	currentTimeStepLabel := self newLabel.

	speedDropList := self newDropList
		                 help: 'Speed of simulation';
		                 items: self speedDropListItems;
		                 selectItem: 'normal';
		                 yourself.

	displayEveryNumberPresenter := self newNumberInput
		                beInteger;
		                minimum: 1;
		                number: 1;
		                yourself.

	self beInPauseMode.

	notebook := self newNotebook.

	"A hack to overcome an issue with notebook pages that were added to an empty notebook not signalling the event when they are selected"
	notebook addPage: (SpNotebookPage title: 'Empty' provider: [ self newLabel ]).

	"By default this page is disabled. It will be enabled when the simulation: setter is called"
	self enabled: false
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeRunButtonWithPauseAction [

	runButton
		icon: CMIcons pauseIcon;
		action: [ self pauseSimulation ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeRunButtonWithRunAction [

	runButton
		icon: CMIcons runIcon;
		action: [ simulation isSimulationProcessConfigured
			ifFalse: [ self runSimulationUntilEnd ]
			ifTrue: [ self resumeSimulation ] ]
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
	self setSimulationStepDelay.
	simulation simulationRunner whenFinishedDo: [ self beInPauseMode ].
	
	self displayCurrentTimeStep.
	self enabled: true.
	self initializeNotebookPages.
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> pauseSimulation [

	self beInPauseMode.
	simulation simulationRunner pause
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> resumeSimulation [

	self beInRunningMode.
	simulation simulationRunner resume
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> runSimulationUntilEnd [

	self beInRunningMode.

	simulation
		runAllStepsAfterEach: displayEveryNumberPresenter number
		do: [
			[ self updateAfterStep ] onErrorDo: [ :error |
					error asString = '#intersect: was sent to nil' ifFalse: [ error signal ] ] ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> setSimulationStepDelay [

	simulation simulationRunner stepDelay: self speedInMilliseconds.
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
		'10x slower' .
		'5x slower' .
		'2x slower' .
		'normal' .
		'2x faster'.
		'5x faster'.
		'10x faster' }
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> speedInMilliseconds [

	| normalSpeed mapping |
	normalSpeed := 200.

	mapping := {
		'10x slower' -> (normalSpeed * 10) .
		'5x slower' -> (normalSpeed * 5) .
		'2x slower' -> (normalSpeed * 2) .
		'normal' -> normalSpeed .
		'2x faster' -> (normalSpeed / 2) .
		'5x faster' -> (normalSpeed / 5) .
		'10x faster' -> (normalSpeed / 10)
	} asDictionary.
	
	^ mapping at: speedDropList selectedItem
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> stepSimulation [

	simulation runStep.
	self updateAfterStep.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateAfterStep [

	self displayCurrentTimeStep.
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
