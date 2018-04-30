tests
testAfterInitializationAConwayModelHas10000Cells
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: (model allTheEntities:CMConwayCell) size == 10000