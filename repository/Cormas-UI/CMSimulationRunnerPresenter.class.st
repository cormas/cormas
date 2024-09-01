Class {
	#name : 'CMSimulationRunnerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'simulation',
		'runButton',
		'stepButton',
		'progressBarLabel',
		'progressBar',
		'finalStep',
		'speedDropList',
		'displayEvery',
		'notebook',
		'spacePresenter',
		'dataTable',
		'parametersTable',
		'chartPresenter'
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
		activeInitMethod: (CMMockModel >> #initFixed);
		activeControlMethod: (CMMockModel >> #step:);
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

{ #category : 'public' }
CMSimulationRunnerPresenter >> buildChart [

	chartPresenter := self
		instantiate: CMChartPresenter
		on: { simulation . translator } 
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> connectPresenters [

	finalStep whenNumberChangedDo: [ :number |
		simulation finalTimeStep: number ].
]

{ #category : 'specs' }
CMSimulationRunnerPresenter >> defaultLayout [

	| row1Height row2Height |
	
	row1Height := self class labelHeight.
	row2Height := self class buttonHeight.

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tStepButtonLabel height: row1Height;
				add: stepButton height: row2Height;
				yourself) width: 40;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tRun height: row1Height;
				add: runButton height: row2Height;
				yourself) width: 40;
			add: '';
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tFinalStep height: row1Height;
				add: finalStep height: row2Height;
				yourself) width: self class buttonWidth;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tSpeedLabel height: row1Height;
				add: speedDropList height: row2Height;
				yourself) width: 120;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tDisplayEveryLabel height: row1Height;
				add: displayEvery height: row2Height;
				yourself) width: self class buttonWidth;
			yourself) height: row1Height + row2Height + 3;
		add: (SpBoxLayout newLeftToRight 
			spacing: 3;
			add: (SpBoxLayout newTopToBottom
				add: translator tProgressBarLabel height: self class labelHeight;
				add: progressBarLabel height: self class labelHeight;
				yourself) width: 80;
			add: progressBar;
			yourself) height: self class labelHeight * 2 + 1;
		add: notebook;
		yourself
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

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeDataTable [
	
	dataTable := self newTable
		beResizable;
		yourself.
	
	simulation activeProbes do: [ :probe |
		dataTable
			addColumn: (SpStringTableColumn
				title: probe name
				evaluated: [ :dataRow | dataRow at: probe name ]) ].
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeNotebookPages [

	self initializeSpacePresenter.
	self initializeDataTable.
	self initializeParametersTable.
	self buildChart.
	"self updateChart."
	
	notebook removeAll.
	
	notebook addPage: (SpNotebookPage
		title: translator tSpace
		icon: (self iconNamed: #paint)
		provider: [ spacePresenter ]).
		
	notebook addPage: (SpNotebookPage
		title: translator tData
		icon: (self iconNamed: #database)
		provider: [ dataTable ]).
		
	notebook addPage: (SpNotebookPage
		title: translator tCharts
		icon: CMIcons chartIcon
		provider: [ chartPresenter ]).
		
	notebook addPage: (SpNotebookPage
		title: translator tParameters
		icon: (self iconNamed: #configuration)
		provider: [ parametersTable ]).
		
	notebook addPage: (SpNotebookPage
		title: translator tInspector
		icon: (self iconNamed: #smallInspectIt)
		provider: [ StInspectorPresenter onObject: simulation ]).
		
	notebook selectPageIndex: 1.
	self updateAfterStep.
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeParametersTable [
	
	parametersTable := CMParametersEditorPresenter
		forParameters: simulation cormasModel class parameters
		translator: translator
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializePresenters [
	
	runButton := self newButton
		icon: CMIcons runIcon;
		action: [ self runSimulationUntilEnd ];
		help: translator tRunButtonHelp;
		yourself.
		
	stepButton := self newButton
		icon: CMIcons stepIcon;
		action: [ self stepSimulation ];
		help: translator tStepButtonHelp;
		yourself.
		
	progressBar := self newProgressBar.
		
	progressBarLabel := self newLabel
		label: self progressString;
		yourself.
		
	finalStep := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		number: CMSimulation defaultFinalTimeStep;
		yourself.
	
	speedDropList := self newDropList
		help: translator tSpeedHelp;
		items: self speedDropListItems;
		selectItem: translator tSpeedNormal; 
		yourself.
		
	displayEvery := self newNumberInput
		beInteger;
		minimum: 1;
		number: 1;
		yourself.
		
	notebook := self newNotebook.
	
	"By default this page is disabled. It will be enabled when the simulation: setter is called"
	self enabled: false
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeSpacePresenter [
	
	spacePresenter := self instantiate: CMSpacePresenter on: simulation cormasModel
]

{ #category : 'initialization' }
CMSimulationRunnerPresenter >> initializeWithSimulation [

	self enabled: true.
	self initializeNotebookPages.
	self updateProgressBar.
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> progressString [

	^ 'Step ', (simulation
		ifNil: [ '0' ]
		ifNotNil: [ simulation currentTimeStep asString ])
]

{ #category : 'actions' }
CMSimulationRunnerPresenter >> runSimulationUntilEnd [

	[ [ simulation currentTimeStep < simulation finalTimeStep ] whileTrue: [
		(displayEvery number min: (simulation finalTimeStep - simulation currentTimeStep))
			timesRepeat: [ simulation runStep ].
			
		self updateAfterStep.
		(Delay forMilliseconds: self speedSelectedItemToMilliseconds) wait ] ] fork.
]

{ #category : 'accessing - model' }
CMSimulationRunnerPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'accessing' }
CMSimulationRunnerPresenter >> simulation: aSimulation [

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

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> speedSelectedItemToMilliseconds [

	| normalSpeed mapping |
	normalSpeed := 200.

	mapping := {
		translator tSpeed10xSlower -> (normalSpeed * 10) .
		translator tSpeed5xSlower -> (normalSpeed * 5) .
		translator tSpeed2xSlower -> (normalSpeed * 2) .
		translator tSpeedNormal -> normalSpeed .
		translator tSpeed2xFaster -> (normalSpeed / 2) .
		translator tSpeed5xFaster -> (normalSpeed / 5) .
		translator tSpeed10xFaster -> (normalSpeed / 10)
	} asDictionary.
	
	^ mapping at: speedDropList selectedItem
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

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> updateAfterStep [

	spacePresenter updateDiagram.
	dataTable items: simulation data.
	self updateProgressBar.
	self updateChart.
]

{ #category : 'public' }
CMSimulationRunnerPresenter >> updateChart [

	chartPresenter updateCharts.
]

{ #category : 'as yet unclassified' }
CMSimulationRunnerPresenter >> updateProgressBar [

	progressBarLabel label: self progressString.
	progressBar fixedAt: (simulation currentTimeStep / simulation finalTimeStep) asFloat.
]
