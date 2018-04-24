tests
testAfterInitializationAConwayModelHas100Entities
	| model |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	self assert: model allTheEntities size == 100