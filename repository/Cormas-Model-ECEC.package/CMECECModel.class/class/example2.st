examples
example2
	
	| aModel |
	
	aModel := self initialize new initSimulation.

	(CMPharoGridSimulation new 
		on: aModel with: aModel theCMECECVegetationUnits) 
			runAndVisualize.