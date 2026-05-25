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
	| model |
	model := CMMockModel new.
	(self on: { model parameters . { model } }) open
]

{ #category : 'initialization' }
CMParametersPresenter >> connectPresenters [

	applyButton action: [
		parameterPresenters do: [ :each | each applyChange ] ]
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
CMParametersPresenter >> initializePresenters [

	parameterPresenters := parameters collect: [ :parameter |
		self instantiate: parameter specPresenterClass on: { parameter . targets } ].
	
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
