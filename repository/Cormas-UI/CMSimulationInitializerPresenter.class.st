Class {
	#name : 'CMSimulationInitializerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'modelClass',
		'modelInitializationSettings',
		'parametersButton',
		'initializeButton',
		'initializeBlock',
		'isReinitializeBlock'
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

	parametersButton action: [ self openParametersEditor ].

	initializeButton action: [
		isReinitializeBlock value
			ifFalse: [ initializeBlock value ]
			ifTrue: [ self confirmReinitialize ].
			
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
		add: modelInitializationSettings;
		add: parametersButton height: self class buttonHeight;
		add: initializeButton height: self class buttonHeight;
		yourself
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> initializePresenters [ 

	isReinitializeBlock := [ false ].
	initializeBlock := [ "do nothing" ].

	modelInitializationSettings := self
		instantiate: CMModelInitializationSettingsPresenter
		on: translator.
		
	modelInitializationSettings modelClass: modelClass.
	
	parametersButton := self newButton
		label: 'Parameters';
		icon: (self iconNamed: #configuration);
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

	^ (CMSimulation for: modelClass)
		activeInitMethod: modelInitializationSettings initMethod;
		activeControlMethod: modelInitializationSettings controlMethod;
		initializeSimulation;
		yourself
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
