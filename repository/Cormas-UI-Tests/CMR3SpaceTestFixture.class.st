Class {
	#name : #CMR3SpaceTestFixture,
	#superclass : #Object,
	#instVars : [
		'model',
		'builder',
		'presenter'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #accessing }
CMR3SpaceTestFixture >> builder [

	^ builder
]

{ #category : #states }
CMR3SpaceTestFixture >> initialCellColors [

	"Shape colors of a grid for the cells of the initial mock model with a fixed random seed"
	
	^ self initialCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : #states }
CMR3SpaceTestFixture >> initialCellStates [

	"Initial cell states of a mock model with a fixed random seed"
	
	^ OrderedCollection withAll: #(
		alive alive alive dead
		dead dead alive dead
		alive dead dead alive
		dead dead dead dead).
]

{ #category : #initialization }
CMR3SpaceTestFixture >> initialize [

	super initialize.
	
	model := CMMockModel new
		randomSeed: 42;
		initializeSimulation;
		yourself.

	builder := CMR3SpaceDiagramBuilder new
		cormasModel: model;
		yourself.
		
	presenter := builder asPresenter.
]

{ #category : #accessing }
CMR3SpaceTestFixture >> model [

	^ model
]

{ #category : #accessing }
CMR3SpaceTestFixture >> presenter [

	^ presenter
]

{ #category : #states }
CMR3SpaceTestFixture >> updatedCellColors [

	"Shape colors of a grid for the cells of the mock model with a fixed random seed after one simulation step"
	
	^ self updatedCellStates collect: [ :each |
		each = #alive
			ifTrue: [ Color white ]
			ifFalse: [ Color black ] ]
]

{ #category : #states }
CMR3SpaceTestFixture >> updatedCellStates [

	"Cell states of a mock model with a fixed random seed after one simulation step"
	
	^ OrderedCollection withAll: #(
		dead dead dead alive
		alive alive dead alive
		dead alive alive dead
		alive alive alive alive).
]
