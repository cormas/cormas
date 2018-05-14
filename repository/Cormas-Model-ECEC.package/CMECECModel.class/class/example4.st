examples
example4
	| aModel |
	aModel := self initialize new initSimulation.
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theESE
		withSituatedEntities: aModel allTheSituatedEntities) runAndVisualize