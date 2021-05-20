"
Simulation interface.
This is the inner part of the main application window.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	backwardAllButton:		<Object>
	backwardLabel:		<Object>
	backwardStepButton:		<Object>
	changeButton:		<Object>
	closeButton:		<Object>
	currentStepInputText:		<Object>
	currentStepLabel:		<Object>
	finalStepInputText:		<Object>
	finalStepLabel:		<Object>
	forwardAllButton:		<Object>
	forwardLabel:		<Object>
	forwardStepButton:		<Object>
	initializeLabel:		<Object>
	replayAllButton:		<Object>
	replayButton:		<Object>
	replayLabel:		<Object>
	replayStepButton:		<Object>
	simulateButton:		<Object>
	simulateLabel:		<Object>


    Implementation Points
"
Class {
	#name : #CMSpecSimulationWindow,
	#superclass : #CMSpecObject,
	#instVars : [
		'simulateLabel',
		'replayLabel',
		'initializeLabel',
		'backwardLabel',
		'currentStepLabel',
		'forwardLabel',
		'closeButton',
		'changeButton',
		'replayButton',
		'backwardAllButton',
		'backwardStepButton',
		'currentStepInputText',
		'runStepByStepButton',
		'runButton',
		'replayRunForwardButton',
		'finalStepInputText',
		'finalStepLabel',
		'replayStepForwardButton',
		'initializeSimButton',
		'forwardStepButton',
		'forwardAllButton',
		'replayStepButton',
		'replayAllButton'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecSimulationWindow class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :c | 
			c
				newRow: [ :r | 
					r
						newColumn: [ :ec |  ] width: 80;
						add: #initializeLabel width: 80;
						add: #backwardLabel width: 100;
						newColumn: [ :ec |  ] width: 100;
						add: #forwardLabel width: 70;
						add: #closeButton width: 30 ]
					height: self toolbarHeight - 5;
				newRow: [ :r | 
					r
						newColumn: [ :col | 
							col
								add: #simulateLabel;
								add: #replayLabel ]
							width: 70;
						newColumn: [ :col | 
							col
								add: #initializeSimButton;
								add: #replayButton ]
							width: 70;
						newColumn: [ :col | 
							col
								newRow: [ :er | 
									er
										add: #backwardAllButton;
										add: #backwardStepButton ] ]
							width: 100;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								add: #currentStepLabel;
								add: #currentStepInputText height: self inputTextHeight;
								newRow: [ :ec |  ] ]
							width: 70;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								newRow: [ :er | 
									er
										add: #runStepByStepButton;
										add: #runButton ];
								newRow: [ :er | 
									er
										add: #replayStepForwardButton;
										add: #replayRunForwardButton ] ]
							width: 100;
						newColumn: [ :ec |  ] width: 10;
						newColumn: [ :col | 
							col
								add: #finalStepLabel;
								newRow: [ :er |  ] height: self inputTextHeight;
								add: #finalStepInputText height: self inputTextHeight;
								newRow: [ :er |  ] height: self inputTextHeight - 4;
								add: #changeButton height: self inputTextHeight - 4 ]
							width: 70 ] ]
]

{ #category : #example }
CMSpecSimulationWindow class >> example [

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: (CMTranslator newForLanguage: #EN);
		initialize;
		openWithSpec
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardAllButton [
	" Answer the backwardAllButton of this CMSpecSimulationWindow "

	^ backwardAllButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardAllButton: anObject [
	" Sets the backwardAllButton of this CMSpecSimulationWindow "

	backwardAllButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardLabel [
	" Answer the backwardLabel of this CMSpecSimulationWindow "

	^ backwardLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardLabel: anObject [
	" Sets the backwardLabel of this CMSpecSimulationWindow "

	backwardLabel := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardStepButton [
	" Answer the backwardStepButton of this CMSpecSimulationWindow "

	^ backwardStepButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> backwardStepButton: anObject [
	" Sets the backwardStepButton of this CMSpecSimulationWindow "

	backwardStepButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> changeButton [
	" Answer the changeButton of this CMSpecSimulationWindow "

	^ changeButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> changeButton: anObject [
	" Sets the changeButton of this CMSpecSimulationWindow "

	changeButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> closeButon [
	" Answer the closeButton of this CMSpecSimulationWindow "

	^ closeButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> closeButton [
	" Answer the closeButton of this CMSpecSimulationWindow "

	^ closeButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> closeButton: anObject [
	" Sets the closeButton of this CMSpecSimulationWindow "

	closeButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> currentStepInputText [
	" Answer the currentStepInputText of this CMSpecSimulationWindow "

	^ currentStepInputText
]

{ #category : #accessing }
CMSpecSimulationWindow >> currentStepInputText: anObject [
	" Sets the currentStepInputText of this CMSpecSimulationWindow "

	currentStepInputText := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> currentStepLabel [
	" Answer the currentStepLabel of this CMSpecSimulationWindow "

	^ currentStepLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> currentStepLabel: anObject [
	" Sets the currentStepLabel of this CMSpecSimulationWindow "

	currentStepLabel := anObject
]

{ #category : #callbacks }
CMSpecSimulationWindow >> defineScenarioAction [
	" Private - Callback for the simulation button in the main Simulation Window "

	(self projectManager currentProjectHasInitMethods and: [ self projectManager currentProjectHasControlMethods ])
		ifTrue: [ CMSpecConfirmBeforeLaunch openFor: self projectManager ]
		ifFalse: [
			self projectManager currentProjectHasInitMethods 
				ifFalse: [ 
					self informMessage: self translator tDefineInit4Scenario. 
					self openBrowserAt: self cormasModelClass tag: #init ].
			self projectManager currentProjectHasControlMethods
				ifFalse: [ 
					self informMessage: self translator tDefineControl4Scenario. 
					self openBrowserAt: self cormasModelClass tag: #control ]  ]
]

{ #category : #morphic }
CMSpecSimulationWindow >> defineScenarioButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #defineScenarioAction;
		labelGraphic: (self iconNamed: #defineScenarioIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Define the scenario';
		yourself.
]

{ #category : #morphic }
CMSpecSimulationWindow >> exec1StepButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #exec1StepAction;
		labelGraphic: (self iconNamed: #exec1StepIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Execute 1 step';
		yourself.
]

{ #category : #accessing }
CMSpecSimulationWindow >> finalStepInputText [
	" Answer the finalStepInputText of this CMSpecSimulationWindow "

	^ finalStepInputText
]

{ #category : #accessing }
CMSpecSimulationWindow >> finalStepInputText: anObject [
	" Sets the finalStepInputText of this CMSpecSimulationWindow "

	finalStepInputText := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> finalStepLabel [
	^ finalStepLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> finalStepLabel: anObject [
	finalStepLabel := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardAllButton [
	^ forwardAllButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardAllButton: anObject [
	forwardAllButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardLabel [
	" Answer the forwardLabel of this CMSpecSimulationWindow "

	^ forwardLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardLabel: anObject [
	" Sets the forwardLabel of this CMSpecSimulationWindow "

	forwardLabel := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardStepButton [
	^ forwardStepButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> forwardStepButton: anObject [
	forwardStepButton := anObject
]

{ #category : #initialization }
CMSpecSimulationWindow >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 700 @ 200

]

{ #category : #initialization }
CMSpecSimulationWindow >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	self initializeMorphs.
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeButtons [

	self changeButton label: self translator tChange.
	self closeButton 
		icon: (self iconNamed: #smallCancelIcon);
		action: [ self delete ];
		help: self translator tSimCloseHelp.
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeFocus [
	" Private - See superimplementor's comment "

	self focusOrder
		add: self closeButton;
		add: self changeButton;
		add: self initializeSimButton;
		add: self replayButton;
		add: self backwardAllButton;
		add: self backwardStepButton;
		add: self currentStepInputText;
		add: self replayStepForwardButton;
		add: self replayRunForwardButton;
		add: self runStepByStepButton;
		add: self runButton;
		add: self finalStepInputText
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeInputs [

	self currentStepInputText
		text: 0;
		help: self translator tSimStepHelp.
	self finalStepInputText
		text: 0;
		help: self translator tSimFinalStepHelp
]

{ #category : #accessing }
CMSpecSimulationWindow >> initializeLabel [
	" Answer the initializeLabel of this CMSpecSimulationWindow "

	^ initializeLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> initializeLabel: anObject [
	" Sets the initializeLabel of this CMSpecSimulationWindow "

	initializeLabel := anObject
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeLabels [

	self simulateLabel 
		label: self translator tSimulate;
		color: Color red.
	self replayLabel 
		label: self translator tReplay;
		color: Color purple.

	self finalStepLabel label: self translator tFinalStep.
	self currentStepLabel label: self translator tCurrentStep.
	self initializeLabel label: self translator tInitialize.
	self backwardLabel label:  self translator tBackwardLabel.
	self forwardLabel label: self translator tForwardLabel.
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeMorphs [

	self initializeSimButton: self defineScenarioButtonMorph asSpecAdapter.
	self replayButton: self replayAStoredSimButtonMorph asSpecAdapter.
	self backwardAllButton: self replaySimBackwardButtonMorph asSpecAdapter.
	self backwardStepButton: self run1StepBackwardButtonMorph asSpecAdapter.
	self runStepByStepButton: self runStepByStepButtonMorph asSpecAdapter.
	self runButton: self runButtonMorph asSpecAdapter.
	self replayStepForwardButton: self replayStepForwardButtonMorph asSpecAdapter.
	self replayRunForwardButton: self replayRunForwardButtonMorph asSpecAdapter.
	self forwardStepButton: self exec1StepButtonMorph asSpecAdapter.
	self forwardAllButton: self runAllSimButtonMorph asSpecAdapter.
	self replayStepButton: self replay1StoredStepButtonMorph asSpecAdapter.
	self replayAllButton: self replayStoredSimButtonMorph asSpecAdapter.
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializePresenter [
	" Private - See superimplementor's comment "

	self changeButton action: [ CMSpecStepMethodChoice openFor: self projectManager ].

]

{ #category : #accessing }
CMSpecSimulationWindow >> initializeSimButton [
	" Answer the simulateButton of this CMSpecSimulationWindow "

	^ initializeSimButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> initializeSimButton: anObject [
	" Sets the simulateButton of this CMSpecSimulationWindow "

	initializeSimButton := anObject
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeSubscriptions [

	self projectAnnouncer
		when: CMTimeChangedAnnouncement
		do: [ : ann | self newCurrentStepValue: ann timeStep ]
]

{ #category : #initialization }
CMSpecSimulationWindow >> initializeWidgets [
	" Private - See superimplementor's comment "

	self instantiateModels: #(simulateLabel LabelModel replayLabel LabelModel initializeLabel LabelModel backwardLabel LabelModel currentStepLabel LabelModel finalStepLabel LabelModel forwardLabel LabelModel currentStepInputText TextInputFieldModel finalStepInputText TextInputFieldModel changeButton ButtonModel closeButton ButtonModel).
	self 
		initializeFocus;
		initializeLabels;
		initializeButtons;
		initializeInputs;
		initializeSubscriptions.

]

{ #category : #changes }
CMSpecSimulationWindow >> newCurrentStepValue: anInteger [

	anInteger isInteger ifFalse: [ self halt ].
	self currentStepInputText text: anInteger asString.
]

{ #category : #morphic }
CMSpecSimulationWindow >> replay1StoredStepButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #replay1StoredStepAction;
		labelGraphic: (self iconNamed: #replay1StoredStepIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay 1 stored step';
		yourself.
]

{ #category : #callbacks }
CMSpecSimulationWindow >> replayAStoredSimAction [
	" #openReplayWin "

	self currentProject hasStoredSimulations
		ifFalse: [ self alertMessage: self translator tNoStoredSim ]
		ifTrue: [ self requestStoredSims: self projectManager storedSimulations ]

]

{ #category : #morphic }
CMSpecSimulationWindow >> replayAStoredSimButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #replayAStoredSimAction;
		labelGraphic: (self iconNamed: #replayAStoredSimIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay a stored simulation';
		yourself.
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayAllButton [
	^ replayAllButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayAllButton: anObject [
	replayAllButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayButton [
	" Answer the replayButton of this CMSpecSimulationWindow "

	^ replayButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayButton: anObject [
	" Sets the replayButton of this CMSpecSimulationWindow "

	replayButton := anObject
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayLabel [
	" Answer the replayLabel of this CMSpecSimulationWindow "

	^ replayLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayLabel: anObject [
	" Sets the replayLabel of this CMSpecSimulationWindow "

	replayLabel := anObject
]

{ #category : #callbacks }
CMSpecSimulationWindow >> replayRunForwardAction [
	self cormasModel spaceModelEntities
		ifNil: [ ^ self alertMessage: 'The spaceModel is  not yet initialized' ]
		ifNotNil:
			[ :aSetOfentities | aSetOfentities ifEmpty: [ ^ self alertMessage: 'The simulation has no spatial entities' ] ].
	(CMSimulationGrid new
		on: self cormasModel
		withCells: self cormasModel spaceModelEntities
		withSituatedEntities: self cormasModel allTheSituatedEntities) runAndVisualize

	"(CMPharoGridSimulation new on: self cormasModel) 
			runAndVisualize."
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayRunForwardButton [
	^ replayRunForwardButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayRunForwardButton: anObject [
	replayRunForwardButton := anObject
]

{ #category : #morphic }
CMSpecSimulationWindow >> replayRunForwardButtonMorph [
	^ IconicButton new
		target: self;
		actionSelector: #replayRunForwardAction;
		labelGraphic: (self iconNamed: #replayRunForwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay stored simulation';
		yourself
]

{ #category : #morphic }
CMSpecSimulationWindow >> replaySimBackwardButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #replaySimBackwardAction;
		labelGraphic: (self iconNamed: #replaySimBackwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay simulation backward';
		yourself.
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayStepButton [
	^ replayStepButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayStepButton: anObject [
	replayStepButton := anObject
]

{ #category : #callbacks }
CMSpecSimulationWindow >> replayStepForwardAction [

	self halt.
	
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayStepForwardButton [
	^ replayStepForwardButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> replayStepForwardButton: anObject [
	replayStepForwardButton := anObject
]

{ #category : #morphic }
CMSpecSimulationWindow >> replayStepForwardButtonMorph [
	^ IconicButton new
		target: self;
		actionSelector: #replayStepForwardAction;
		labelGraphic: (self iconNamed: #replayStepForwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay 1 stored step';
		yourself
]

{ #category : #morphic }
CMSpecSimulationWindow >> replayStoredSimButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #replayStoredSimAction;
		labelGraphic: (self iconNamed: #replayStoredSimIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Replay stored simulation';
		yourself.
]

{ #category : #callbacks }
CMSpecSimulationWindow >> requestStepSim: simName directory: dumpDir [ 

	| directoryContent firstStep |
	self simFolder: simName.
	self simNumero: self simNumero + 1.
	self enableBackward: true.

	directoryContent := simName asFileReference entries.
	(directoryContent removeAllSuchThat: [ : txt | (txt beginsWith: self stepNameStart) not]) isEmpty
		ifTrue: [ ^ self alertMessage: simName , self translator tNoStoredSimFolder ].

	self traceSize: directoryContent size - 1.
	self traceSize > 1
		ifTrue: [ 
			self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true ].

	(firstStep := self getStepNumberOfBosFilename: directoryContent first) > 0
		ifTrue: [ self alertMessage: self translator tReplayStartStep , firstStep printString ].
	self currentTime: firstStep.
	self cormas cycle value: self traceSize + firstStep.
	self cormasModel spaceModel ifNil: [ self cormasModel initializeSpaceModel ].
	self replayStepForward: firstStep
]

{ #category : #callbacks }
CMSpecSimulationWindow >> requestStoredSims: directoryContent [

	| cmSimName dumpDir |
	cmSimName := directoryContent
		detect: [ : txt | txt = self simName ]
		ifNone: [ directoryContent first ].
	self simName: cmSimName.
	(dumpDir := self 
		requestDirectoryName: self translator tChooseDumpDir
		from: ((self application dumpPath: self cormasModel class name) / cmSimName)) isEmpty
			ifFalse: [ self requestStepSim: dumpDir ].
]

{ #category : #morphic }
CMSpecSimulationWindow >> run1StepBackwardButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #run1StepBackwardAction;
		labelGraphic: (self iconNamed: #run1StepBackwardIcon);
		color: Color transparent;
		borderColor: Color purple;
		borderWidth: 1;
		helpText: 'Return 1 step backward';
		yourself.
]

{ #category : #callbacks }
CMSpecSimulationWindow >> runAction [
	" Callback for the run all steps button "

	self validateRunStep
		ifFalse: [ self cormasModel initSimulation ].
	self simManager finalTime: self finalStepInputText text asInteger.
	self simManager loopRunStep_untilFinalTime.
	self currentStepInputText text: self finalStepInputText text.
]

{ #category : #morphic }
CMSpecSimulationWindow >> runAllSimButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #runAllSimAction;
		labelGraphic: (self iconNamed: #runAllSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Run simulation until final step';
		yourself.
]

{ #category : #accessing }
CMSpecSimulationWindow >> runButton [
	^ runButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> runButton: anObject [
	runButton := anObject
]

{ #category : #morphic }
CMSpecSimulationWindow >> runButtonMorph [
	^ IconicButton new
		target: self;
		actionSelector: #runAction;
		labelGraphic: (self iconNamed: #runSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Run simulation until final step';
		yourself
]

{ #category : #callbacks }
CMSpecSimulationWindow >> runStepByStepAction [
	" Private - Request simulation manager to execute 1 step. Initialize the simulation if not set. Update the UI "

	self validateRunStep
		ifFalse: [ self cormasModel initSimulation ].
	self simManager runStepByStep.
	self currentStepInputText text: (self cormasModel timeStep asString)
]

{ #category : #accessing }
CMSpecSimulationWindow >> runStepByStepButton [
	^ runStepByStepButton
]

{ #category : #accessing }
CMSpecSimulationWindow >> runStepByStepButton: anObject [
	runStepByStepButton := anObject
]

{ #category : #morphic }
CMSpecSimulationWindow >> runStepByStepButtonMorph [

	^ IconicButton new
		target: self;
		actionSelector: #runStepByStepAction;
		labelGraphic: (self iconNamed: #runStepByStepSimIcon);
		color: Color transparent;
		borderColor: Color red;
		borderWidth: 1;
		helpText: 'Execute 1 step';
		yourself.
]

{ #category : #accessing }
CMSpecSimulationWindow >> simManager [
	^ self cormasModel simManager
]

{ #category : #accessing }
CMSpecSimulationWindow >> simulateLabel [
	" Answer the simulateLabel of this CMSpecSimulationWindow "

	^ simulateLabel
]

{ #category : #accessing }
CMSpecSimulationWindow >> simulateLabel: anObject [
	" Sets the simulateLabel of this CMSpecSimulationWindow "

	simulateLabel := anObject
]

{ #category : #initialization }
CMSpecSimulationWindow >> title [
	" Private - See superimplementor's comment "

	^ ''
]

{ #category : #testing }
CMSpecSimulationWindow >> validateRunStep [
	" Answer <true> if the receiver's model is ready to run "
	
	^ self cormasModel isInitialized
]
