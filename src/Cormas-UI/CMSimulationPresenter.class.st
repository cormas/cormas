Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'modelClass',
		'fancyNotebookButtons',
		'fancyNotebookPage',
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

	| buttonsLayout |
	
	buttonsLayout := SpBoxLayout newTopToBottom.
	
	fancyNotebookButtons do: [ :button |
		buttonsLayout add: button height: 40 ].

	^ SpBoxLayout newLeftToRight
		spacing: 4;
		add: buttonsLayout width: 40;
		add: fancyNotebookPage width: 250;
		"this null presented is a hack to have a larger spacing between 2nd and 3rd column than the one between 1st and 2nd column while keeping all 3 columns in the same layout. If they are in different layouts, hiding column 2 will not expand column 3"
		add: SpNullPresenter new width: 6;
		add: simulationRunner;
		yourself
]

{ #category : 'examples' }
CMSimulationPresenter >> example [
	<script: 'self example'>
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> hideOrShowFancyNotebookPage [

	(fancyNotebookButtons anySatisfy: #isActive)
		ifTrue: [ fancyNotebookPage show ]
		ifFalse: [ fancyNotebookPage hide ].
		
	"if we don't do this, the width of the page will not be applied in the layout"
	self update
]

{ #category : 'initialization' }
CMSimulationPresenter >> initialize [

	whenWindowIsClosedHooks := OrderedCollection new.
	"Call super after initializing the hooks variable"
	super initialize
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeFancyNotebook [
		
	| pages selectedPage |
	
	pages := self collectFancyNotebookPages.
	
	fancyNotebookButtons := pages collect: [ :page |
		self newToggleButton
			icon: page icon;
			help: page title;
			whenActivatedDo: [ "we keep it here and not in controlPresenters because we need to access page"
				selectedPage := page.
				fancyNotebookPage updatePresenter ];
			whenChangedDo: [ 
				self hideOrShowFancyNotebookPage ] ].
		
	fancyNotebookButtons size > 1 ifTrue: [ 
		fancyNotebookButtons first associatedToggleButtons: fancyNotebookButtons allButFirst ].
		
	fancyNotebookPage := self newPresenterSelector.
	
	pages do: [ :page | fancyNotebookPage
		when: [ selectedPage = page ]
		show: [ page retrievePresenter ] ].

	fancyNotebookPage
		defaultShow: [ self newLabel label: 'Choose one!' ];
		"update presenter is needed to make sure the presenter will have correct initial 
		 value (before anything happens)"
		updatePresenter.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	
	modelClass initializeParameters.
	
	self initializeFancyNotebook.

	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter.
		
	stopConditionPresenter := self
		instantiate: CMStopConditionPresenter
		on: modelClass.
				
	fancyNotebookButtons ifNotEmpty: [ fancyNotebookButtons first click ]
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
	<fancyNotebookPageOrder: 5>
	
	^ SpNotebookPage
		title: 'Random numbers'
		icon: (self iconNamed: #configuration)
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
