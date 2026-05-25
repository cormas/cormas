Class {
	#name : 'CMSelectionParametersPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'cormasModel',
		'selectedEntities',
		'manualSelectionRadio',
		'classRadio',
		'allAgentsRadio',
		'allCellsRadio',
		'classDropList',
		'selectionSummary',
		'clearSelectionButton',
		'parametersPresenter'
	],
	#category : 'Cormas-UI-Parameters',
	#package : 'Cormas-UI',
	#tag : 'Parameters'
}

{ #category : 'examples' }
CMSelectionParametersPresenter class >> example [
	<example>
	| model |
	model := CMMockModel new.
	
	(CMSimulation for: model)
		activeInitSelector: #initFixed;
		activeControlSelector: #step:;
		initializeSimulation.
	
	(self on: model) open
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> commonSuperclassOfSelection [

	| commonSuperclass |
	selectedEntities ifEmpty: [ self error: 'No entities were selected' ].
	
	commonSuperclass := selectedEntities first class.
	
	selectedEntities do: [ :each |
		(each isKindOf: commonSuperclass) ifFalse: [ 
			commonSuperclass := each class commonSuperclassWith: commonSuperclass ] ].
	
	^ commonSuperclass
]

{ #category : 'initialization' }
CMSelectionParametersPresenter >> connectPresenters [

	manualSelectionRadio whenActivatedDo: [ self selectManually ].
	allAgentsRadio whenActivatedDo: [ self selectAllAgents ].
	allCellsRadio whenActivatedDo: [ self selectAllCells ].
	
	classRadio whenActivatedDo: [
		classDropList enable.
		self selectAllEntitiesOfClass ].
	
	classRadio whenDeactivatedDo: [ classDropList disable ].
	
	classDropList whenSelectedItemChangedDo: [ self selectAllEntitiesOfClass ].
	
	clearSelectionButton action: [ manualSelectionRadio click ]
]

{ #category : 'layout' }
CMSelectionParametersPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		borderWidth: 3;
		add: (SpBoxLayout newTopToBottom
			add: manualSelectionRadio expand: false;
			add: (SpBoxLayout newLeftToRight 
				add: classRadio width: 50;
				add: classDropList;
				yourself) expand: false;
			add: allAgentsRadio expand: false;
			add: allCellsRadio expand: false;
			yourself) expand: false;
		add: '' height: 5;
		add: selectionSummary expand: false;
		add: clearSelectionButton expand: false;
		add: parametersPresenter;
		yourself.
]

{ #category : 'examples' }
CMSelectionParametersPresenter >> example [
	<script: 'self example'>
]

{ #category : 'initialization' }
CMSelectionParametersPresenter >> initializePresenters [

	selectedEntities := OrderedCollection new.
	parametersPresenter := self newPresenterSelector.

	manualSelectionRadio := self newRadioButton
		label: 'Select by clicking';
		yourself.
		
	classRadio := self newRadioButton
		label: 'All:';
		yourself.
		
	allAgentsRadio := self newRadioButton
		label: 'All agents';
		yourself.
		
	allCellsRadio := self newRadioButton
		label: 'All cells';
		yourself.
		
	manualSelectionRadio associatedRadioButtons: { classRadio . allAgentsRadio . allCellsRadio }.
	
	classDropList := self newDropList
		items: cormasModel class allEntityClasses asOrderedCollection;
		disable;
		yourself.
	
	selectionSummary := self newLabel.
	self updateSelectionSummary.
		
	clearSelectionButton := self newButton
		label: 'Clear selection';
		yourself.
		
	parametersPresenter
		when: [ selectedEntities isEmpty ]
		show: [ self newLabel label: 'Please select some entities'; yourself ];
		when: [ self commonSuperclassOfSelection = CMEntity ]
		show: [ self newLabel label: 'Selected entities must have a common superclass'; yourself ];
		defaultShow: [
			self
				instantiate: CMParametersPresenter
				on: { self commonSuperclassOfSelection instanceSideParameters . selectedEntities } ];
		updatePresenter.
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> selectAllAgents [

	selectedEntities := OrderedCollection withAll: cormasModel agents.
	self updateSelectionSummary
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> selectAllCells [

	selectedEntities := OrderedCollection withAll: cormasModel cells.
	self updateSelectionSummary
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> selectAllEntitiesOfClass [

	selectedEntities := OrderedCollection withAll: (cormasModel entitiesOfClass: classDropList selectedItem).
	self updateSelectionSummary
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> selectManually [

	selectedEntities removeAll.
	self updateSelectionSummary
]

{ #category : 'accessing - model' }
CMSelectionParametersPresenter >> setModelBeforeInitialization: aCormasModel [

	cormasModel := aCormasModel
]

{ #category : 'as yet unclassified' }
CMSelectionParametersPresenter >> updateSelectionSummary [

	selectionSummary label: 'Selected ', selectedEntities size asString, ' entities'.
	parametersPresenter updatePresenter
]
