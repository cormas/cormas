examples
example5
	| aModel |
	self setActiveProbes: OrderedCollection new.
	aModel := self initialize new initSimulation.
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theESE
		withSituatedEntities: aModel allTheSituatedEntities) runAndVisualizeWithMenus goSlow