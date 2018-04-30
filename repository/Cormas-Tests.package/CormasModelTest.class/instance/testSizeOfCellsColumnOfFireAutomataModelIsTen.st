tests
testSizeOfCellsColumnOfFireAutomataModelIsTen
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	choosenModel defaultInit: #init58WithFire.
	aModel := choosenModel
		initialize;
		new.
	aModel initializeSpaceModel.
	aModel initSimulation.
	self assert: (aModel selectCellsOfColumn: 1) size equals: 10