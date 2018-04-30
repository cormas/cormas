tests
testWhenYouPickACellOfAModelThisIsASpatialEntity
	| modelClass aModel |
	modelClass := CMFireAutomataModel.
	modelClass initialize.
	aModel := modelClass new.
	aModel initSimulation.
	self assert: aModel pickCell isSpatialEntity