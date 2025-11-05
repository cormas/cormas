Class {
	#name : 'CMSimulationInitializerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'modelInitializationSettings',
		'initializeButton',
		'shouldWarnWhenReinitializeCheckbox',
		'editParametersButton',
		'resetParametersButton',
		'isReinitializeBlock',
		'rulesActivatorButton',
		'initializeBlock',
		'rulesApplierButton'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationInitializerPresenter class >> example [
	<example>
	
	(self forModelClass: CMMockModel translator: CMEnglishTranslator new) open
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter class >> forModelClass: aClass translator: aTranslator [

	^ self on: { aClass . aTranslator }
]

{ #category : 'enumerating' }
CMSimulationInitializerPresenter >> beReinitializeCondition: aBlock [

	isReinitializeBlock := aBlock
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> confirmReinitialize [

	SpConfirmDialog new
		  title: 'Warning!';
		  label: (String streamContents: [ :stream |
				stream 
					nextPutAll: 'Are you sure you want to reinitialize the simulation?';
					cr;
					nextPutAll: 'Current simulation data will be lost' ]);
		  acceptLabel: 'Yes';
		  cancelLabel: 'No';
		  onAccept: [ self reinitializeModel ];
		  onCancel: [ "do nothing" ];
		  openModal
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> connectPresenters [

	editParametersButton action: [ self openParametersEditor ].
	resetParametersButton action: [ modelClass initializeParameters ].

	initializeButton action: [
		isReinitializeBlock value
			ifFalse: [ self initializeModel  ]
			ifTrue: [ 
				shouldWarnWhenReinitializeCheckbox state
					ifTrue: [ self confirmReinitialize ]
					ifFalse: [ self reinitializeModel ] ].
			
		self updateInitializeButton ].
	
	modelInitializationSettings whenChangedDo: [
		modelInitializationSettings isDefined
			ifTrue: [ initializeButton enable ]
			ifFalse: [ initializeButton disable ] ].

	rulesActivatorButton action: [ 
		modelClass areRulesActive
			ifTrue: [ modelClass deactivateRules ]
			ifFalse: [ modelClass activateRules ].
		self updateRulesActivatorButton ].

	rulesApplierButton action: [ 
		modelClass areRulesApplied
			ifTrue: [ modelClass unapplyRules ]
			ifFalse: [ modelClass applyRules ].
		self updateRulesApplierButton ]
]

{ #category : 'layout' }
CMSimulationInitializerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 10;
		add: modelInitializationSettings height: 190;
		add: (SpBoxLayout newLeftToRight
			add: translator tParameters expand: false;
			add: '';
			add: editParametersButton width: self class buttonHeight;
			add: resetParametersButton width: self class buttonHeight;
			yourself) height: self class buttonHeight;
		add: rulesActivatorButton width: self class buttonHeight;
		add: rulesApplierButton width: self class buttonHeight;
		add: '';
		add: shouldWarnWhenReinitializeCheckbox height: self class buttonHeight;
		add: initializeButton height: self class buttonHeight;
		yourself
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> disableInitialization [
	
	| presenters |
	
	presenters := self layout allPresenters select: [ :each | each isKindOf: SpPresenter ].

	(presenters copyWithoutAll: { editParametersButton . resetParametersButton })
		do: [ :each | each enabled: false ].
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> initializeModel [

	^ initializeBlock value
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> initializePresenters [ 

	isReinitializeBlock := [ false ].
	initializeBlock := [ "do nothing" ].
	
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
		
	shouldWarnWhenReinitializeCheckbox := self newCheckBox
		label: 'Ask before reinitializing';
		state: false;
		yourself.
	
	initializeButton := self newButton
		disable;
		yourself.
	self updateInitializeButton.
	
	rulesActivatorButton := self newButton.
	self updateRulesActivatorButton.
	
	rulesApplierButton := self newButton.
	self updateRulesApplierButton
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> openParametersEditor [

	(CMParametersEditorPresenter
		forParameters: modelClass parameters
		translator: translator)
		open
	
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> reinitializeModel [

	"simulation cleanModelData."
	^ self initializeModel
]

{ #category : 'accessing - model' }
CMSimulationInitializerPresenter >> setModelBeforeInitialization: aCollection [

	modelClass := aCollection first.
	translator := aCollection second
]

{ #category : 'accessing' }
CMSimulationInitializerPresenter >> simulation [
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
		
	owner finalTimeStep ifNotNil: [ :number | simulation finalTimeStep: number ].
	
	modelInitializationSettings isFixRandomSeed ifTrue: [ 
		simulation randomSeed: modelInitializationSettings randomSeed.
		simulation shouldReleaseRandomSeedAfterInitialization:
			modelInitializationSettings isReleaseRandomSeedAfterInitialization ].
		
	simulation initializeSimulation.
	
	^ simulation
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> updateInitializeButton [

	isReinitializeBlock value
		ifTrue: [
			initializeButton
				label: 'Reinitialize simulation';
				icon: (self iconNamed: #glamorousRestart) ]
		ifFalse: [ 
			initializeButton
				label: 'Initialize simulation';
				icon: (self iconNamed: #smallNew) ]
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> updateRulesActivatorButton [

	modelClass areRulesActive
		ifTrue: [
				rulesActivatorButton
					label: translator tRulesDeactivator;
					icon: (self iconNamed: #cancel) ]
		ifFalse: [
				rulesActivatorButton
					label: translator tRulesActivator;
					icon: (self iconNamed: #accept) ]
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> updateRulesApplierButton [

	modelClass areRulesApplied
		ifTrue: [
				rulesApplierButton
					label: 'Unapply rules';
					icon: (self iconNamed: #into) ]
		ifFalse: [
				rulesApplierButton
					label: 'Apply rules';
					icon: (self iconNamed: #over) ]
]

{ #category : 'enumerating' }
CMSimulationInitializerPresenter >> whenInitializedDo: aBlock [

	initializeBlock := aBlock
]
