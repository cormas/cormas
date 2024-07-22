Class {
	#name : 'CMR3SpaceTestFixture',
	#superclass : 'Object',
	#instVars : [
		'model',
		'builder',
		'presenter',
		'simulation'
	],
	#category : 'Cormas-UI-Tests-Core',
	#package : 'Cormas-UI-Tests',
	#tag : 'Core'
}

{ #category : 'accessing' }
CMR3SpaceTestFixture >> builder [

	^ builder
]

{ #category : 'states' }
CMR3SpaceTestFixture >> initialCellColors [

	"Shape colors of a grid for the cells of the initial mock model"
	
	^ self initialCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : 'states' }
CMR3SpaceTestFixture >> initialCellStates [

	"Initial cell states of a mock model"

	^ model cellMatrix flattened asOrderedCollection collect: [ :each |
		each = 1
			ifTrue: [ #alive ]
			ifFalse: [ #dead ] ].
]

{ #category : 'initialization' }
CMR3SpaceTestFixture >> initialize [

	super initialize.
	
	model := CMMockModel new.
		
	simulation := (CMSimulation for: model)
		activeInitMethod: (CMMockModel >> #initFixed);
		activeControlMethod: (CMMockModel >> #step:);
		initializeSimulation;
		yourself.

	builder := CMR3SpaceDiagramBuilder new
		cormasModel: model;
		yourself.
		
	presenter := builder asPresenter.
]

{ #category : 'accessing' }
CMR3SpaceTestFixture >> model [

	^ model
]

{ #category : 'accessing' }
CMR3SpaceTestFixture >> presenter [

	^ presenter
]

{ #category : 'accessing' }
CMR3SpaceTestFixture >> simulation [

	^ simulation
]

{ #category : 'states' }
CMR3SpaceTestFixture >> updatedCellColors [

	"Shape colors of a grid for the cells of the mock model with a fixed random seed after one simulation step"
	
	^ self updatedCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : 'states' }
CMR3SpaceTestFixture >> updatedCellStates [

	"Cell states of a mock model with a fixed random seed after one simulation step"
	
	^ self initialCellStates collect: [ :each |
		each = #alive
			ifTrue: [ #dead ]
			ifFalse: [ #alive ] ]
]
