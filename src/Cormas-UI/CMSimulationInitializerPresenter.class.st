Class {
	#name : 'CMSimulationInitializerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'modelInitializationSettings',
		'initializeButton',
		'initializeBlock',
		'shouldWarnWhenReinitializeCheckbox',
		'isReinitializeBlock',
		'editParametersButton',
		'resetParametersButton'
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

{ #category : 'as yet unclassified' }
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
		  onAccept: [ initializeBlock value ];
		  onCancel: [ "do nothing" ];
		  openModal
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> connectPresenters [

	editParametersButton action: [ self openParametersEditor ].
	resetParametersButton action: [ modelClass initializeParameters ].

	initializeButton action: [
		isReinitializeBlock value
			ifFalse: [ initializeBlock value ]
			ifTrue: [
				shouldWarnWhenReinitializeCheckbox state
					ifTrue: [ self confirmReinitialize ]
					ifFalse: [ initializeBlock value ] ].
			
		self updateInitializeButton ].
	
	modelInitializationSettings whenChangedDo: [
		modelInitializationSettings isDefined
			ifTrue: [ initializeButton enable ]
			ifFalse: [ initializeButton disable ] ].
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
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> openParametersEditor [

	(CMParametersEditorPresenter
		forParameters: modelClass parameters
		translator: translator)
		open
	
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
	simulation := CMSimulation for: modelClass.

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

{ #category : 'enumerating' }
CMSimulationInitializerPresenter >> whenInitializedDo: aBlock [

	initializeBlock := aBlock
]
