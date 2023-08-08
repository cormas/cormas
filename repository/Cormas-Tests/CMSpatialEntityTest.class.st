Class {
	#name : #CMSpatialEntityTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'cellWithNoAgents',
		'cellWithOneAgent',
		'cellWithTwoAgents'
	],
	#category : #'Cormas-Tests-Model'
}

{ #category : #initialization }
CMSpatialEntityTest >> setUp [

	super setUp.
	
	model := CMMockModel new
		randomSeed: 1;
		initializeSimulation;
		yourself.
		
	cellWithNoAgents := model pickCellAt: 1@1.
	cellWithOneAgent := model pickCellAt: 1@2.
	cellWithTwoAgents := model pickCellAt: 3@4.
	
]

{ #category : #tests }
CMSpatialEntityTest >> testHasNoOccupants [

	self assert: cellWithNoAgents hasNoOccupants.
	self deny: cellWithOneAgent hasNoOccupants.
	self deny: cellWithTwoAgents hasNoOccupants.
]

{ #category : #tests }
CMSpatialEntityTest >> testHasNoOccupantsExcept [

	self assert: cellWithNoAgents hasNoOccupants.
	self deny: cellWithOneAgent hasNoOccupants.
	self deny: cellWithTwoAgents hasNoOccupants.
]

{ #category : #tests }
CMSpatialEntityTest >> testHasOccupants [

	self deny: cellWithNoAgents hasOccupants.
	self assert: cellWithOneAgent hasOccupants.
	self assert: cellWithTwoAgents hasOccupants.
]
