Class {
	#name : 'CMSimulationInitializerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'initSelectorDropList',
		'controlSelectorDropList',
		'randomNumbersPresenter',
		'initializeButton',
		'initializeButtonBlock'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'examples' }
CMSimulationInitializerPresenter class >> example [
	<example>
	| app |
	app := CMSimulationApplication new.
	app cormasModel: CMMockModel new.
	(app newPresenter: self) open
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> applyRandomNumberGeneratorSettings [

	randomNumbersPresenter apply
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> connectPresenters [

	initializeButtonBlock := [ :initSelector :controlSelector | "do nothing" ].

	initializeButton action: [
		initializeButtonBlock
			value: initSelectorDropList selectedItem
			value: controlSelectorDropList selectedItem ].
	
	initSelectorDropList whenSelectedItemChangedDo: [ :item | self ensureAllInitSettingsDefined ].
	controlSelectorDropList whenSelectedItemChangedDo: [ :item | self ensureAllInitSettingsDefined ]
]

{ #category : 'layout' }
CMSimulationInitializerPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 12;
		add: (SpBoxLayout newTopToBottom
			spacing: 1;
			add: 'Init method' expand: false;
			add: initSelectorDropList expand: false;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			spacing: 1;
			add: 'Control method' expand: false;
			add: controlSelectorDropList expand: false;
			yourself) expand: false;
		add: SpNullPresenter new;
		add: randomNumbersPresenter;
		add: SpNullPresenter new;
		add: initializeButton height: CMActivityBar activityButtonHeight;
		yourself
]

{ #category : 'as yet unclassified' }
CMSimulationInitializerPresenter >> ensureAllInitSettingsDefined [
	"Check if we have all the required settings for initializing a simulation: init method, control method, etc. If no - disable the initialize button"

	^ initSelectorDropList selectedItem
		ifNotNil: [ initializeButton enable ]
		ifNil: [ initializeButton disable ]
]

{ #category : 'examples' }
CMSimulationInitializerPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> initializePresenters [

	| modelClass |
	modelClass := self application cormasModel class.

	initSelectorDropList := self newDropList.
	controlSelectorDropList := self newDropList.
	
	initSelectorDropList items: modelClass availableInitSelectors.
	controlSelectorDropList items: modelClass availableControlSelectors.
	
	randomNumbersPresenter := self instantiate: CMSimulationInitRandomPresenter. 
		
	initializeButton := self newButton
		disable;
		label: 'Initialize simulation';
		icon: (self iconNamed: #smallNew)
		yourself.

	self ensureAllInitSettingsDefined
]

{ #category : 'initialization' }
CMSimulationInitializerPresenter >> updatePresenter [

	super updatePresenter.
	randomNumbersPresenter showCurrentSettings 
]

{ #category : 'enumerating' }
CMSimulationInitializerPresenter >> whenInitializeButtonClickedDo: aBlock [
	"A two-argument block where first argument is the selected init selector and the second argument is the selected control selector"
	
	initializeButtonBlock := aBlock
]
