tests
testDominanceOfAModelIsLessThanOne
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	aModel := choosenModel
		initialize;
		new.
	aModel class defaultInit: #init58WithFire.
	aModel initSimulation.
	self assert: (aModel dominance: #state) < 1.0