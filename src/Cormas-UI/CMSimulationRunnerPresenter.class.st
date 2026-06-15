Class {
	#name : 'CMSimulationRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
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
	#category : 'Cormas-UI-Simulation',
	#package : 'Cormas-UI',
	#tag : 'Simulation'
}

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> example [
	<example>
	| app simulation |

	simulation := (CMSimulation for: CMMockModel new)
		randomSeed: 41;
		activeInitSelector: #initFixed;
		activeControlSelector: #step;
		initializeSimulation;
		yourself.
		
	app := CMSimulationApplication new.
	app simulation: simulation.
	app cormasModel: simulation cormasModel.
	(app newPresenter: CMSimulationRunnerPresenter) open
]

{ #category : 'examples' }
CMSimulationRunnerPresenter class >> exampleEmpty [
	<example>
	(CMSimulationApplication new newPresenter: self) open
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
	
	speedDropList whenSelectedItemChangedDo: [ :item | self setSimulationIntervalDelay ].
	
	notebook whenSelectedPageChangedDo: [ :page |
		self updateSelectedNotebookPage ].
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> cormasModel [

	^ self simulation cormasModel
]

{ #category : 'specs' }
CMSimulationRunnerPresenter >> defaultLayout [

	| simulationControlsLayout |
	
	simulationControlsLayout := SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 2;
				   add: 'Step' expand: false;
				   add: stepButton;
				   yourself)
		  width: 60;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 2;
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
				   spacing: 2;
				   add: 'Speed' expand: false;
				   add: speedDropList;
				   yourself)
		  height: 52;
		  add: (SpBoxLayout newTopToBottom
				   spacing: 2;
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

	currentTimeStepLabel label: ('Step: ', self simulation currentTimeStep asString)
]

{ #category : 'examples' }
CMSimulationRunnerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> fitDiagram [

	self simulation ifNil: [ ^ self ].
	spacePresenter fitDiagram.
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

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeNotebookPages [
	
	spacePresenter := self instantiate: CMSpacePresenter.
	chartPresenter := self instantiate: CMChartPresenter.
	
	dataTable := self instantiate: CMDataPresenter.
	dataTable columnNames: (self simulation activeProbes collect: #name).

	self flag: 'TODO'.
	"This is a hack to avoid a nasty Spec bug. When we remove all pages after changing a nancy notebook page (a different presenter), it breaks because it can't find the model"
	"notebook removeAll."
	notebook pages size timesRepeat: [ notebook removePageAt: 1 ].

	spacePage := SpNotebookPage
		             title: 'Space'
		             provider: [ spacePresenter ].

	dataPage := SpNotebookPage
		            title: 'Data'
		            provider: [ dataTable ].

	chartsPage := SpNotebookPage
		              title: 'Charts'
		              provider: [ chartPresenter ].

	notebook addPage: spacePage.
	notebook addPage: dataPage.
	notebook addPage: chartsPage.

	notebook addPage: (SpNotebookPage
			 title: 'Inspector'
			 provider: [ StInspectorPresenter onObject: self simulation ]).

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
	self enabled: false.
	
	self simulation ifNotNil: [ self updateWithSimulation ]
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
		action: [ self simulation isSimulationProcessConfigured
			ifFalse: [ self runSimulationUntilEnd ]
			ifTrue: [ self resumeSimulation ] ]
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
CMSimulationRunnerPresenter >> pauseSimulation [

	self beInPauseMode.
	self simulation pause
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> resumeSimulation [

	self beInRunningMode.
	self simulation resume
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> runSimulationUntilEnd [

	self beInRunningMode.
	self setStepsPerInterval.

	self simulation runAllStepsAfterEachIntervalDo: [
		[ self updateAfterStep ] onErrorDo: [ :error |
			error asString = '#intersect: was sent to nil'
				ifFalse: [ error signal ] ] ]
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> setSimulationIntervalDelay [

	self simulation intervalDelay: self speedInMilliseconds.
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> setStepsPerInterval [

	self simulation stepsPerInterval: displayEveryNumberPresenter number.
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> simulation [

	^ self application simulation 
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

	self simulation runStep.
	self updateAfterStep.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateAfterStep [

	self displayCurrentTimeStep.
	self updateSelectedNotebookPage.
	
	"To apply the new value entered into the number input"
	self setStepsPerInterval
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateChart [

	chartPresenter updateCharts.
]

{ #category : 'update presenters' }
CMSimulationRunnerPresenter >> updateDataTable [

	dataTable showData: self simulation data
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

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> updateWithSimulation [

	self setSimulationIntervalDelay.
	self simulation whenFinishedDo: [ self beInPauseMode ].
	
	self displayCurrentTimeStep.
	self enabled: true.
	self initializeNotebookPages.
]
