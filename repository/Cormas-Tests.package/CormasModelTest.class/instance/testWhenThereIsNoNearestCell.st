tests
testWhenThereIsNoNearestCell
	| model oneCell |
	model := CMConwayModel
		initialize;
		new.
	model activeInit: #initSmallGrid.
	model initSimulation.
	oneCell := (model allTheEntities: CMConwayCell) atRandom.
	self
		should: [ oneCell shortestDistanceToCellsVerifying: [ :c | c state = #zork ] ]
		raise: Error