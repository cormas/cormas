tests
testNumberOfDifferentStateInAFireAutomataIsThree
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
	self assert: (aModel nClasses: #state) equals: 3