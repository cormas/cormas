tests
testWhenYouPickACellOfAModelThisIsASpatialEntity
	| modelClass aModel |
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
	aModel initSimulation.
	self assert: aModel pickCell isSpatialEntity