Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'simulation',
		'builder',
		'translator',
		'runButton',
		'stepButton',
		'progressBarLabel',
		'progressBar',
		'finalStep',
		'speedDropList',
		'displayEvery',
		'notebook',
		'diagram'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMSimulationPresenter class >> openForSimulation: aSimulation withTranslator: aTranslator [

	^ self basicNew 
		simulation: aSimulation;
		translator: aTranslator;
		initialize;
		open;
		yourself
]

{ #category : 'accessing' }
CMSimulationPresenter >> canvas [
	" Private - Answer a <RSCanvas> "

	^ diagram canvas
]

{ #category : 'initialization' }
CMSimulationPresenter >> connectPresenters [

	finalStep whenNumberChangedDo: [ :number |
		simulation finalTimeStep: number ].
]

{ #category : 'specs' }
CMSimulationPresenter >> defaultLayout [

	| row1Height row2Height |
	
	row1Height := self class labelHeight.
	row2Height := self class buttonHeight.

	^ SpBoxLayout newTopToBottom
		spacing: 4;
		add: (SpBoxLayout newLeftToRight
			spacing: 5;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tStepButtonLabel height: row1Height;
				add: stepButton height: row2Height;
				yourself) width: 40;
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tRunButtonLabel height: row1Height;
				add: runButton height: row2Height;
				yourself) width: 40;
			add: (SpBoxLayout newTopToBottom 
				spacing: 3;
				add: translator tProgressBarLabel height: row1Height;
				add: progressBar height: self class buttonHeight;
				yourself);
			add: (SpBoxLayout newTopToBottom
				spacing: 3;
				add: translator tFinalStepLabel height: row1Height;
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
				yourself) width: 120;
			yourself) height: row1Height + row2Height + 3;
		add: notebook;
		yourself
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeCanvasInteractions [

	self canvas addInteraction: RSCanvasController new.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeDiagram [
	" Private - Create the configured receiver's diagram "
	
	builder := CMR3SpaceDiagramBuilder new
		cormasModel: simulation cormasModel.
	
	"diagram := self newRoassal.
	diagram script: [ :canvas | builder renderIn: canvas ].
	"
	diagram := builder asPresenter.
		
	diagram owner: self.
	self update.
	
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	" Private - See superimplementor's comment "
	
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
		
	progressBar := self newProgressBar
		fixedAt: 0.0;
		yourself.
		
	finalStep := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		number: simulation finalTimeStep;
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
	
	self initializeDiagram.
	self initializeCanvasInteractions.
	
	notebook
		addPageTitle: 'Space View'
		provider: [ diagram ].
		
	notebook
		addPageTitle: 'Data'
		provider: [ self newTable ].
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'Simulation';
		initialExtent: 800@500;
		whenResizingDo: [ 
			self canvas camera zoomToFit.
			self canvas signalUpdate ].
]

{ #category : 'actions' }
CMSimulationPresenter >> runSimulationUntilEnd [

	[ [ simulation currentTimeStep < simulation finalTimeStep ] whileTrue: [
		(displayEvery number min: (simulation finalTimeStep - simulation currentTimeStep))
			timesRepeat: [ simulation runStep ].
			
		self updateAfterStep.
		(Delay forMilliseconds: self speedSelectedItemToMilliseconds) wait ] ] fork.
]

{ #category : 'accessing' }
CMSimulationPresenter >> simulation: aSimulation [

	simulation := aSimulation
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> speedDropListItems [

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
CMSimulationPresenter >> speedSelectedItemToMilliseconds [

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
CMSimulationPresenter >> stepSimulation [

	simulation runStep.
	self updateAfterStep.
]

{ #category : 'accessing' }
CMSimulationPresenter >> translator: anObject [

	translator := anObject
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateAfterStep [

	builder update.
	self updateProgressBar.
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateProgressBar [

	progressBar fixedAt: (simulation currentTimeStep / simulation finalTimeStep) asFloat.
]
