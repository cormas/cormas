tests
testACellInConwayModelIsAtDistanceOneToAnotherCell
	| model oneCell |
	model := CMConwayModel
		initialize;
		new.
	model initSimulation.
	oneCell := (model allTheEntities: CMConwayCell) atRandom.
	self assert: (oneCell shortestDistanceToCellsVerifying: [ :c | c state = #dead | (c state = #alive) ]) equals: 1