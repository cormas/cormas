examples
example2
	| aModel |
	aModel := self initialize new initSimulation.
	(CMSimulationGrid new on: aModel with: aModel theCMECECVegetationUnits) runAndVisualize