tests
testWhenAfterRunningTheModel20TimesTheProbesResultHaveTheSameSize
	| modelClass aModel nbSteps result |
	modelClass := CMFireAutomataModel.
	modelClass initialize.
	nbSteps := 20.
	aModel := modelClass new.
	aModel initSimulation.
	aModel pickCell isSpatialEntity.
	result := OrderedCollection new.
	nbSteps
		timesRepeat: [ aModel runStep.
			result add: aModel nbTrees ].
	self assert: result size equals: 20