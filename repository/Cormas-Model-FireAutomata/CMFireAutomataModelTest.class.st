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
		createGridLines: 100
		columns: 100
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
		createGridLines: 10
		columns: 10
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
		createGridLines: 10
		columns: 10
		neighbourhood: 4
		closed: true.
	aModel activeInit: #init58WithFire.
	aModel initSimulation.
	self assert: (aModel selectCellsOfColumn: 1) size equals: 10
]

{ #category : #tests }
CMFireAutomataModelTest >> testWhenAfterRunningTheModel20TimesTheProbesResultHaveTheSameSize [
	| modelClass aModel nbSteps result |
	modelClass := CMFireAutomataModel.
	modelClass defaultInit: #init58WithFire.
	modelClass initialize.
	aModel := modelClass new.
	aModel initializeSpaceModel.
	aModel
		createGridLines: 100
		columns: 100
		neighbourhood: 4
		closed: true.
	nbSteps := 20.
	aModel initSimulation.
	aModel pickCell isSpatialEntity.
	result := OrderedCollection new.
	nbSteps
		timesRepeat: [ aModel runStep.
			result add: aModel nbTrees ].
	self assert: result size equals: 20
]

{ #category : #tests }
CMFireAutomataModelTest >> testWhenYouPickACellOfAModelThisIsASpatialEntity [
	| modelClass aModel |
	modelClass := CMFireAutomataModel.
	"modelClass defaultInit: #init58WithFire."
	modelClass initialize.
	aModel := modelClass new.
	aModel initializeSpaceModel.
		aModel
		createGridLines: 100
		columns: 100
		neighbourhood: 4
		closed: true.
	aModel initSimulation.
	self assert: aModel pickCell isSpatialEntity
]
