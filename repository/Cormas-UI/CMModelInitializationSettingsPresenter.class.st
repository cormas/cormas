Class {
	#name : 'CMModelInitializationSettingsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'translator',
		'fixRandomSeedCheckbox',
		'randomSeedInput',
		'releaseRandomSeedCheckbox',
		'initMethodDropList',
		'controlMethodDropList',
		'modelClass'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMModelInitializationSettingsPresenter class >> example [
	<example>
	
	((self forTranslator: CMEnglishTranslator new)
		modelClass: CMMockModel;
		yourself) open
]

{ #category : 'as yet unclassified' }
CMModelInitializationSettingsPresenter class >> forTranslator: aTranslator [

	^ self on: aTranslator 
]

{ #category : 'as yet unclassified' }
CMModelInitializationSettingsPresenter >> controlMethod [

	^ controlMethodDropList selectedItem
]

{ #category : 'layout' }
CMModelInitializationSettingsPresenter >> defaultLayout [

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
				   add: initMethodDropList height: buttonHeight;
				   yourself)
		  height: labelHeight + buttonHeight;
		  add: releaseRandomSeedCheckbox height: 25;
		  add: (SpBoxLayout newTopToBottom
				   add: translator tControlMethod height: labelHeight;
				   add: controlMethodDropList height: buttonHeight;
				   yourself)
		  height: labelHeight + buttonHeight;
		  yourself
]

{ #category : 'as yet unclassified' }
CMModelInitializationSettingsPresenter >> disableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is deactivated"
	
	randomSeedInput beNotEditable.
	randomSeedInput disable.
	releaseRandomSeedCheckbox disable.
]

{ #category : 'as yet unclassified' }
CMModelInitializationSettingsPresenter >> enableRandomSeedPresenters [
	"Will be called when Fix random seed checkbox is activated"
	
	randomSeedInput beEditable.
	randomSeedInput enable.
	releaseRandomSeedCheckbox enable.
]

{ #category : 'as yet unclassified' }
CMModelInitializationSettingsPresenter >> initMethod [

	^ initMethodDropList selectedItem
]

{ #category : 'initialization' }
CMModelInitializationSettingsPresenter >> initializePresenters [
	
	fixRandomSeedCheckbox := self newCheckBox
		label: translator tFixRandomSeed;
		whenActivatedDo: [ self enableRandomSeedPresenters ];
		whenDeactivatedDo: [ self disableRandomSeedPresenters ];
		yourself.
		
	randomSeedInput := self newNumberInput.
	
	releaseRandomSeedCheckbox := self newCheckBox
		label: translator tReleaseRandomSeedAfterInitialization;
		yourself.
		
	self disableRandomSeedPresenters.
	
	initMethodDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		display: [ :method | method selector ];
		placeholder: translator tInitMethod asLowercase respondingTo: #selector;
		yourself.
		
	controlMethodDropList := (self instantiate: CMDropListWithPlaceholderPresenter)
		display: [ :method | method selector ];
		placeholder: translator tControlMethod asLowercase respondingTo: #selector;
		yourself.
]

{ #category : 'initialization' }
CMModelInitializationSettingsPresenter >> initializeWithModel [

	initMethodDropList items: modelClass availableInitMethods.
	controlMethodDropList items: modelClass availableControlMethods.
]

{ #category : 'accessing' }
CMModelInitializationSettingsPresenter >> modelClass: aClass [

	modelClass := aClass.
	self initializeWithModel.
]

{ #category : 'accessing - model' }
CMModelInitializationSettingsPresenter >> setModelBeforeInitialization: aTranslator [

	translator := aTranslator
]
