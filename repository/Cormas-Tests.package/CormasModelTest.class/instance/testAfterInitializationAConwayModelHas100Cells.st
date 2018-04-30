tests
testAfterInitializationAConwayModelHas100Cells
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: (model allTheEntities:CMConwayCell) size == 100