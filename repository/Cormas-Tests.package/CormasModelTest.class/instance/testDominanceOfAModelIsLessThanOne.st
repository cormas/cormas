tests
testDominanceOfAModelIsLessThanOne
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