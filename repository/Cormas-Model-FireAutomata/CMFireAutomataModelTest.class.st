Class {
	#name : #CMFireAutomataModelTest,
	#superclass : #TestCase,
	#category : #'Cormas-Model-FireAutomata-Tests'
}

{ #category : #tests }
CMFireAutomataModelTest >> testDominanceOfAModelIsLessThanOne [
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
CMFireAutomataModelTest >> testModelOfFireAutomataCellReturnFireAutomata [
	self
		assert: CMFireAutomataCell modelClass
		identicalTo: CMFireAutomataModel
]

{ #category : #tests }
CMFireAutomataModelTest >> testNumberOfDifferentStateInAFireAutomataIsThree [
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
CMFireAutomataModelTest >> testSizeOfCellsColumnOfFireAutomataModelIsTen [
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
