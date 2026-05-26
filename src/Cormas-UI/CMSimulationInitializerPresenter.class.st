Class {
	#name : 'CMSimulationInitializerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'initSelectorDropList',
		'controlSelectorDropList',
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
		borderWidth: 5;
		spacing: 12;
		add: (SpBoxLayout newTopToBottom
			add: 'Init method' expand: false;
			add: initSelectorDropList expand: false;
			yourself) expand: false;
		add: (SpBoxLayout newTopToBottom
			add: 'Control method' expand: false;
			add: controlSelectorDropList expand: false;
			yourself) expand: false;
		add: SpNullPresenter new;
		add: initializeButton expand: false;
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
		
	initializeButton := self newButton
		disable;
		label: 'Initialize simulation';
		icon: (self iconNamed: #smallNew)
		yourself.

	self ensureAllInitSettingsDefined
]

{ #category : 'enumerating' }
CMSimulationInitializerPresenter >> whenInitializeButtonClickedDo: aBlock [
	"A two-argument block where first argument is the selected init selector and the second argument is the selected control selector"
	
	initializeButtonBlock := aBlock 
]
