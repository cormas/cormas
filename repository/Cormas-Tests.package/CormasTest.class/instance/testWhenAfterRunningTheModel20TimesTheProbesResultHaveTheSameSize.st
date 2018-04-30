tests
testWhenAfterRunningTheModel20TimesTheProbesResultHaveTheSameSize
	| modelClass aModel nbSteps result |
	modelClass := CMFireAutomataModel.
	modelClass defaultInit: #init58WithFire.
	modelClass initialize.
	aModel := modelClass new.
	aModel initializeSpaceModel.
	aModel
		createGridX: 100
		Y: 100
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