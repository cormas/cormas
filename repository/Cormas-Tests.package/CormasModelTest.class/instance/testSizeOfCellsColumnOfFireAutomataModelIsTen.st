tests
testSizeOfCellsColumnOfFireAutomataModelIsTen
	| choosenModel aModel |
	choosenModel := CMFireAutomataModel.
	choosenModel defaultInit: #init58WithFire.
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
	self assert: (aModel selectCellsOfColumn: 1) size equals: 10