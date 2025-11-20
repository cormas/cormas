Class {
	#name : 'CMSimulationInitializationSettingsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'randomSeedInput',
		'releaseRandomSeedCheckbox',
		'initSelectorDropList',
		'controlSelectorDropList',
		'modelClass',
		'whenChangedBlock',
		'finalStepNumberPresenter'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationInitializationSettingsPresenter class >> example [
	<example>
	
	((self forTranslator: CMEnglishTranslator new)
		modelClass: CMMockModel;
		yourself) open
]

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator 
]

{ #category : 'initialization' }
CMSimulationInitializationSettingsPresenter >> connectPresenters [

	whenChangedBlock := [ "do nothing" ].
		
	randomSeedInput whenNumberChangedDo: [ :number | whenChangedBlock value ].
	releaseRandomSeedCheckbox whenChangedDo: [ :boolean | whenChangedBlock value ].
		
	initSelectorDropList whenSelectedItemChangedDo: [ :item | whenChangedBlock value ].
	controlSelectorDropList whenSelectedItemChangedDo: [ :item | whenChangedBlock value ].
]

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter >> controlSelector [

	^ controlSelectorDropList selectedItem
]

{ #category : 'layout' }
CMSimulationInitializationSettingsPresenter >> defaultLayout [

	| gridLayout |
	gridLayout := SpGridLayout new.

	gridLayout
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder |
				builder
					add: translator tFinalStep;
					add: finalStepNumberPresenter;
					nextRow;
					add: translator tRandomSeed;
					add: randomSeedInput;
					nextRow ].

	^ SpBoxLayout newTopToBottom
		  spacing: 12;
		  add: gridLayout;
		  add: (SpBoxLayout newTopToBottom
				   add: translator tInitMethod;
				   add: initSelectorDropList;
				   yourself)
		  expand: false;
		  add: releaseRandomSeedCheckbox expand: false;
		  add: (SpBoxLayout newTopToBottom
				   add: translator tControlMethod;
				   add: controlSelectorDropList;
				   yourself)
		  expand: false;
		  yourself
]

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter >> disableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is deactivated"
	
	randomSeedInput beNotEditable.
	randomSeedInput disable.
	releaseRandomSeedCheckbox disable.
]

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter >> enableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is activated"
	
	randomSeedInput beEditable.
	randomSeedInput enable.
	releaseRandomSeedCheckbox enable.
]

{ #category : 'settings' }
CMSimulationInitializationSettingsPresenter >> finalTimeStep [

	^ finalStepNumberPresenter number = 0
		  ifTrue: [ nil ]
		  ifFalse: [ finalStepNumberPresenter number ]
]

{ #category : 'settings' }
CMSimulationInitializationSettingsPresenter >> finalTimeStep: anInteger [

	finalStepNumberPresenter number: anInteger
]

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter >> initSelector [

	^ initSelectorDropList selectedItem
]

{ #category : 'initialization' }
CMSimulationInitializationSettingsPresenter >> initializePresenters [
	
	finalStepNumberPresenter := self newNumberInput
		beInteger;
		climbRate: 50;
		minimum: 0;
		yourself.

	randomSeedInput := self newNumberInput.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: translator tReleaseRandomSeedAfterInitialization;
		yourself.
		
	self disableRandomSeedPresenters.
	
	initSelectorDropList := self newDropList.
	controlSelectorDropList := self newDropList.
]

{ #category : 'initialization' }
CMSimulationInitializationSettingsPresenter >> initializeWithModel [

	initSelectorDropList items: modelClass availableInitSelectors.
	controlSelectorDropList items: modelClass availableControlSelectors.
]

{ #category : 'testing' }
CMSimulationInitializationSettingsPresenter >> isDefined [
	"Answer true if simulation is fully defined and can be initialized"
	
	^ initSelectorDropList selectedItem isNotNil
]

{ #category : 'settings' }
CMSimulationInitializationSettingsPresenter >> isReleaseRandomSeedAfterInitialization [

	^ releaseRandomSeedCheckbox state
]

{ #category : 'accessing' }
CMSimulationInitializationSettingsPresenter >> modelClass: aClass [

	modelClass := aClass.
	self initializeWithModel.
]

{ #category : 'settings' }
CMSimulationInitializationSettingsPresenter >> randomSeed [

	^ randomSeedInput number
]

{ #category : 'accessing - model' }
CMSimulationInitializationSettingsPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]

{ #category : 'announcing' }
CMSimulationInitializationSettingsPresenter >> whenChangedDo: aBlock [

	whenChangedBlock := aBlock
]
