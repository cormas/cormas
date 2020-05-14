Class {
	#name : #CormasModelTest,
	#superclass : #TestCase,
	#instVars : [
		'conwayModel'
	],
	#category : #'Cormas-Tests'
}

{ #category : #tests }
CormasModelTest >> testACellInConwayModelIsAtDistanceOneToAnotherCell [
	| model oneCell |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	oneCell := (model allTheEntities: CMConwayCell) atRandom.
	self assert: (oneCell shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ]) equals: 1
]

{ #category : #tests }
CormasModelTest >> testAfterInitializationAConwayModelHas10000Cells [
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self
		assert: (model allTheEntities: CMConwayCell) size
		identicalTo: 10000
]

{ #category : #tests }
CormasModelTest >> testAfterInitializationAConwayModelHas10000Entities [
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: model allTheEntities size identicalTo: 10000
]

{ #category : #tests }
CormasModelTest >> testConwayModelHasNoSocialEntityClass [
	self assert: CMConwayModel socialClasses isEmpty
]

{ #category : #tests }
CormasModelTest >> testConwayModelHasOnlyOneSpatialEntityClass [
	self assert: CMConwayModel spatialClasses size identicalTo: 1
]

{ #category : #tests }
CormasModelTest >> testDominanceOfAModelIsLessThanOne [
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	aModel := choosenModel
		initialize;
		new.
	aModel class defaultInit: #init58WithFire.
	aModel initializeSpaceModel.
	aModel
		createGridX: 100
		Y: 100
		neighbourhood: 4
		closed: true.
	aModel initSimulation.
	self assert: (aModel dominance: #state) < 1.0
]

{ #category : #tests }
CormasModelTest >> testECECModelHasAProbeNamedVegetationBiomass [
	self assert: (CMECECModel probes includes: #vegetationBiomass)
]

{ #category : #tests }
CormasModelTest >> testECECModelHasThreeProbes [
	self assert: CMECECModel probes size equals: 3
]

{ #category : #tests }
CormasModelTest >> testModelOfFireAutomataCellReturnFireAutomata [
	self
		assert: CMFireAutomataCell modelClass
		identicalTo: CMFireAutomataModel
]

{ #category : #tests }
CormasModelTest >> testNumberOfDifferentStateInAFireAutomataIsThree [
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	aModel := choosenModel
		initialize;
		new.
	aModel class defaultInit: #init58WithFire.
	aModel initializeSpaceModel.
	aModel
		createGridX: 10
		Y: 10
		neighbourhood: 4
		closed: true.		
	aModel initSimulation.
	self assert: (aModel nbDistinctValuesOf: #state) equals: 3
]

{ #category : #tests }
CormasModelTest >> testSizeOfCellsColumnOfFireAutomataModelIsTen [
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	aModel := choosenModel
		initialize;
		new.
	aModel initializeSpaceModel.
	aModel
		createGridX: 10
		Y: 10
		neighbourhood: 4
		closed: true.
	aModel activeInit: #init58WithFire.
	aModel initSimulation.
	self assert: (aModel selectCellsOfColumn: 1) size equals: 10
]

{ #category : #tests }
CormasModelTest >> testThereIsTwoClassesInConwayPackage [
	self assert: CMConwayModel allClassesInPackage size identicalTo: 2
]

{ #category : #tests }
CormasModelTest >> testWhenThereIsNoNearestCell [
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
