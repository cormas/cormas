Class {
	#name : 'CMSimulationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'simulationRunner',
		'hideInitializationSettingButton',
		'isInitializerVisible',
		'modelInitializationSettings',
		'initializeButton',
		'shouldWarnWhenReinitializeCheckbox',
		'editParametersButton',
		'resetParametersButton'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationPresenter class >> example [
	<example>
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> beInNotRunningMode [

	| presenters |
	
	presenters := self layout allPresenters select: [ :each | each isKindOf: SpPresenter ].

	(presenters copyWithoutAll: { editParametersButton . resetParametersButton })
		do: [ :each | each enabled: true ].
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> beInRunningMode [

	| presenters |
	
	presenters := self layout allPresenters select: [ :each | each isKindOf: SpPresenter ].

	(presenters copyWithoutAll: { editParametersButton . resetParametersButton })
		do: [ :each | each enabled: false ].
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> confirmReinitialize [

	SpConfirmDialog new
		  title: 'Warning!';
		  label: (String streamContents: [ :stream |
				stream 
					nextPutAll: 'Are you sure you want to reinitialize the simulation?';
					cr;
					nextPutAll: 'Current simulation data will be lost' ]);
		  acceptLabel: 'Yes';
		  cancelLabel: 'No';
		  onAccept: [ self initializeModel ];
		  onCancel: [ "do nothing" ];
		  openModal
]

{ #category : 'initialization' }
CMSimulationPresenter >> connectPresenters [
	"Purpose: While instanciating a new simulation (with #activeInitSelector), set the presenters (grid, diagrams, etc.)"

	editParametersButton action: [ self openParametersEditor ].
	resetParametersButton action: [ modelClass initializeParameters ].

	initializeButton action: [
		self initializeModel.
		self updateInitializeButton ].

	modelInitializationSettings whenChangedDo: [ self ensureAllInitSettingsDefined ].

	self updateInitializeButton
]

{ #category : 'layout' }
CMSimulationPresenter >> defaultLayout [

	| initializerLayout |
	initializerLayout := SpBoxLayout newTopToBottom.
	initializerLayout
		spacing: 10;
		add: modelInitializationSettings;
		add: (SpBoxLayout newLeftToRight
				 add: translator tParameters expand: false;
				 add: SpNullPresenter new;
				 add: editParametersButton;
				 add: resetParametersButton;
				 yourself)
		expand: false;
		add: SpNullPresenter new;
		add: initializeButton expand: false.

	^ SpBoxLayout newLeftToRight
		  add: initializerLayout width: 250;
		  add: (SpBoxLayout newTopToBottom
				   vAlignCenter;
				   add: hideInitializationSettingButton;
				   yourself)
		  width: 25;
		  add: simulationRunner;
		  yourself
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> ensureAllInitSettingsDefined [
	"Check if we have all the required settings for initializing a simulation: init method, control method, etc. If no - disable the initialize button"

	^ modelInitializationSettings isDefined
		  ifTrue: [ initializeButton enable ]
		  ifFalse: [ initializeButton disable ]
]

{ #category : 'examples' }
CMSimulationPresenter >> example [
	<script: 'self example'>
]

{ #category : 'settings' }
CMSimulationPresenter >> finalTimeStep [
	
	^ modelInitializationSettings finalTimeStep
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeModel [

	| simulation |
	simulation := self newSimulation.
	modelInitializationSettings finalTimeStep: simulation finalTimeStep.
	^ simulationRunner simulation: simulation
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializePresenters [
	
	modelClass initializeParameters.

	modelInitializationSettings := self
		instantiate: CMSimulationInitializationSettingsPresenter
		on: translator.
		
	modelInitializationSettings modelClass: modelClass.
	
	editParametersButton := self newButton
		icon: (self iconNamed: #glamorousEdit);
		yourself.
		
	resetParametersButton := self newButton
		icon: (self iconNamed: #glamorousRestart);
		yourself.
		
	initializeButton := self newButton
		disable;
		yourself.

	self ensureAllInitSettingsDefined.
		
	hideInitializationSettingButton := self newButton
		icon: (self iconNamed: #overlayRemove);
		yourself.

	simulationRunner := self
		instantiate: CMSimulationRunnerPresenter
		on: translator.
]

{ #category : 'initialization' }
CMSimulationPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.

	aWindowPresenter 
		title: (modelClass ifNil: ['Simulation'] ifNotNil: [modelClass package name]);
		initialExtent: 1000@600;
		whenResizingDo: [ simulationRunner fitDiagram ].
]

{ #category : 'instance creation' }
CMSimulationPresenter >> newSimulation [
"Purpose: instanciate a new modelClass with init & control selectors. Then initialize this simulation by performing #activeInitSelector.
Reset the currentTimeStep and the data. Set the randomSeed"
	| simulation |
	
	"TODO: A temporary hack to fix the bug with parameters being reset when we reinitialize a model"
	simulation := CMSimulation new
		cormasModel: modelClass newWithoutParameters;
		initializeProbes;
		yourself.

	modelClass parameters do: [ :parameter |
		simulation initialParameterValues at: parameter put: parameter value ].

	simulation
		activeInitSelector: modelInitializationSettings initSelector;
		activeControlSelector: modelInitializationSettings controlSelector.
		
	self finalTimeStep ifNotNil: [ :number | simulation finalTimeStep: number ].

	simulation randomSeed: modelInitializationSettings randomSeed.
	simulation shouldReleaseRandomSeedAfterInitialization:
		modelInitializationSettings isReleaseRandomSeedAfterInitialization.
		
	simulation initializeSimulation.
	
	^ simulation
]

{ #category : 'initialization' }
CMSimulationPresenter >> openParametersEditor [

	(CMParametersEditorPresenter
		forParameters: modelClass parameters
		translator: translator)
		open
	
]

{ #category : 'accessing - model' }
CMSimulationPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> shouldWarnWhenReinitialize [

	^ simulationRunner hasSimulationData
]

{ #category : 'as yet unclassified' }
CMSimulationPresenter >> updateInitializeButton [

	self shouldWarnWhenReinitialize
		ifTrue: [
			initializeButton
				label: 'Reinitialize simulation';
				icon: (self iconNamed: #glamorousRestart) ]
		ifFalse: [ 
			initializeButton
				label: 'Initialize simulation';
				icon: (self iconNamed: #smallNew) ]
]
