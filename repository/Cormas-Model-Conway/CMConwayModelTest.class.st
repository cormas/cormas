Class {
	#name : #CMConwayModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-Conway-Tests'
}

{ #category : #tests }
CMConwayModelTest >> testACellInConwayModelIsAtDistanceOneToAnotherCell [
	| tmp1 tmp2 tmp4 |
	tmp4 := CMConwayModel.
	tmp4 initialize.
	tmp1 := tmp4 new.
	tmp1 initSimulation.
	tmp2 := (tmp1 allTheEntities: CMConwayCell) atRandom.
	self
		assert:
			(tmp2
				shortestDistanceToCellsVerifying: [ :arg1 | arg1 state = #dead | (arg1 state = #alive) ])
		equals: 1
]

{ #category : #tests }
CMConwayModelTest >> testAfterInitializationAConwayModelHas10000Cells [
	| tmp1 tmp3 |
	tmp3 := CMConwayModel.
	tmp3 initialize.
	tmp1 := tmp3 new.
	tmp1 initSimulation.
	self assert: (tmp1 allTheEntities: CMConwayCell) size equals: 10000
]

{ #category : #tests }
CMConwayModelTest >> testAfterInitializationAConwayModelHas10000Entities [
	| tmp1 tmp3 |
	tmp3 := CMConwayModel.
	tmp3 initialize.
	tmp1 := tmp3 new.
	tmp1 initSimulation.
	self assert: tmp1 allTheEntities size equals: 10000
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
CMConwayModelTest >> testThereIsOneEntityClassInConwayModel [
	self assert: CMConwayModel allEntityClasses size equals: 1
]

{ #category : #tests }
CMConwayModelTest >> testThereIsTwoClassesInConwayPackage [
	self assert: CMConwayModel allClassesInPackage size equals: 2
]

{ #category : #tests }
CMConwayModelTest >> testWhenThereIsNoNearestCell [
	| tmp1 tmp2 tmp4 |
	tmp4 := CMConwayModel.
	tmp4 initialize.
	tmp1 := tmp4 new.
	tmp1
		activeInit: #initSmallGrid;
		initSimulation.
	tmp2 := (tmp1 allTheEntities: CMConwayCell) atRandom.
	self
		should: [ tmp2
				shortestDistanceToCellsVerifying: [ :arg1 | arg1 state = #zork ] ]
		raise: Error
]
