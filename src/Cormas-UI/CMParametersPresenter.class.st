Class {
	#name : 'CMParametersPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'parameters',
		'targets',
		'parameterPresenters',
		'applyButton',
		'resetButton'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMParametersPresenter class >> example [
	<example>
	| app model |
	
	app := CMSimulationApplication new.
	model := CMMockModel new.
	
	(self newApplication: app model: { model parameters . { model } }) open
]

{ #category : 'private - announcing' }
CMParametersPresenter >> announceChange [

	"Update spatial grid"
	self application announcer announce: CMSpaceGridChanged new
]

{ #category : 'initialization' }
CMParametersPresenter >> connectPresenters [

	applyButton action: [
		parameterPresenters do: [ :each | each applyChange ].
		self announceChange ].
	
	resetButton action: [ 
		parameterPresenters do: [ :each | each resetValue ].
		self announceChange ]
]

{ #category : 'as yet unclassified' }
CMParametersPresenter >> defaultLayout [

	| parentLayout |
	
	parentLayout := SpBoxLayout newTopToBottom
		spacing: 5;
		yourself.
	
	parameterPresenters do: [ :each |
		parentLayout add: each expand: false ].
	
	parentLayout
		add: SpNullPresenter new;
		add: (SpBoxLayout newLeftToRight
			add: resetButton;
			add: applyButton;
			yourself) expand: false.
		
	^ parentLayout
]

{ #category : 'examples' }
CMParametersPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMParametersPresenter >> initializeParameters [

	parameterPresenters := parameters collect: [ :parameter |
		self instantiate: parameter specPresenterClass on: { parameter . targets } ].
]

{ #category : 'initialization' }
CMParametersPresenter >> initializePresenters [

	self initializeParameters.
	
	applyButton := self newButton
		label: 'Apply';
		icon: (self iconNamed: #accept);
		yourself.
		
	resetButton := self newButton
		label: 'Reset';
		icon: (self iconNamed: #refresh);
		yourself
]

{ #category : 'accessing - model' }
CMParametersPresenter >> setModelBeforeInitialization: aCollection [

	parameters := aCollection first.
	targets := aCollection second
]
