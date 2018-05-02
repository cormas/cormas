examples
example5
	| aModel |
	aModel := self initialize new.
	aModel activeInit: #initGlidersGun.
	aModel initSimulation.
	(CMPharoGridSimulation new
		on: aModel
		withCells: aModel theESE
		withSituatedEntities: aModel allTheSituatedEntities) runAndVisualize