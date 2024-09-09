Class {
	#name : 'CMModelInitializationSettingsPresenter',
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

{ #category : 'initialization' }
CMModelInitializationSettingsPresenter >> connectPresenters [

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
CMModelInitializationSettingsPresenter >> controlSelector [

	^ controlSelectorDropList selectedItem
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
CMModelInitializationSettingsPresenter >> initSelector [

	^ initSelectorDropList selectedItem
]

{ #category : 'initialization' }
CMModelInitializationSettingsPresenter >> initializePresenters [
	
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
CMModelInitializationSettingsPresenter >> initializeWithModel [

	initSelectorDropList items: modelClass availableInitSelectors.
	controlSelectorDropList items: modelClass availableControlSelectors.
]

{ #category : 'testing' }
CMModelInitializationSettingsPresenter >> isDefined [
	"Answer true if simulation is fully defined and can be initialized"
	
	^ initSelectorDropList selectedItem isNotNil
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

{ #category : 'announcing' }
CMModelInitializationSettingsPresenter >> whenChangedDo: aBlock [

	whenChangedBlock := aBlock
]
