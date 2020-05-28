Class {
	#name : #CMConwayModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Conway-Tests'
}

{ #category : #tests }
CMConwayModelTest >> testACellInConwayModelIsAtDistanceOneToAnotherCell [
	| model oneCell |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	oneCell := (model allTheEntities: CMConwayCell) atRandom.
	self assert: (oneCell shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ]) equals: 1
]

{ #category : #tests }
CMConwayModelTest >> testAfterInitializationAConwayModelHas10000Cells [
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: (model allTheEntities: CMConwayCell) size equals: 10000
]

{ #category : #tests }
CMConwayModelTest >> testAfterInitializationAConwayModelHas10000Entities [
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: model allTheEntities size equals: 10000
]

{ #category : #tests }
CMConwayModelTest >> testConwayModelHasNoSocialEntityClass [
	self assert: CMConwayModel socialClasses isEmpty
]

{ #category : #tests }
CMConwayModelTest >> testConwayModelHasOnlyOneSpatialEntityClass [
	self assert: CMConwayModel spatialClasses size equals: 1
]

{ #category : #tests }
CMConwayModelTest >> testThereIsTwoClassesInConwayPackage [
	self assert: CMConwayModel allClassesInPackage size equals: 2
]

{ #category : #tests }
CMConwayModelTest >> testWhenThereIsNoNearestCell [
	| model oneCell |
	model := CMConwayModel
		initialize;
		new.
	model activeInit: #initSmallGrid.
	model initSimulation.
	oneCell := (model allTheEntities: CMConwayCell) atRandom.
	self
		should: [ oneCell shortestDistanceToCellsVerifying: [ :c | c state = #zork ] ]
		raise: Error
]
