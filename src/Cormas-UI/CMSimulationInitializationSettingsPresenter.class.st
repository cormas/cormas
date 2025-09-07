Class {
	#name : 'CMSimulationInitializationSettingsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'fixRandomSeedCheckbox',
		'randomSeedInput',
		'releaseRandomSeedCheckbox',
		'initSelectorDropList',
		'controlSelectorDropList',
		'modelClass',
		'whenChangedBlock'
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

	fixRandomSeedCheckbox
		whenChangedDo: [ :boolean | whenChangedBlock value ];
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ].
		
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

	| labelHeight buttonHeight numberInputWidth |
	labelHeight := self class labelHeight.
	buttonHeight := self class buttonHeight.
	numberInputWidth := 90.
 
	^ SpBoxLayout newTopToBottom
		  spacing: 12;
		  add: (SpBoxLayout newLeftToRight
				   add: fixRandomSeedCheckbox;
				   add: randomSeedInput width: numberInputWidth;
				   yourself)
		  height: 25;
		  add: (SpBoxLayout newTopToBottom
				   add: translator tInitMethod height: labelHeight;
				   add: initSelectorDropList height: buttonHeight;
				   yourself)
		  height: labelHeight + buttonHeight;
		  add: releaseRandomSeedCheckbox height: 25;
		  add: (SpBoxLayout newTopToBottom
				   add: translator tControlMethod height: labelHeight;
				   add: controlSelectorDropList height: buttonHeight;
				   yourself)
		  height: labelHeight + buttonHeight;
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

{ #category : 'as yet unclassified' }
CMSimulationInitializationSettingsPresenter >> initSelector [

	^ initSelectorDropList selectedItem
]

{ #category : 'initialization' }
CMSimulationInitializationSettingsPresenter >> initializePresenters [
	
	fixRandomSeedCheckbox := self newCheckBox
		label: translator tFixRandomSeed;
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
CMSimulationInitializationSettingsPresenter >> isFixRandomSeed [

	^ fixRandomSeedCheckbox state
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
