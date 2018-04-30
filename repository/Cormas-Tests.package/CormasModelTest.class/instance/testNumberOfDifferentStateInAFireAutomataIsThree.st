tests
testNumberOfDifferentStateInAFireAutomataIsThree
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	aModel := choosenModel
		initialize;
		new.
	aModel initSimulation.
	self assert: (aModel nClasses: #state) equals: 4