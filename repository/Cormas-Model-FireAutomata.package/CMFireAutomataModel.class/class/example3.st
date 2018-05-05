examples
example3
	| aModel |
	
	aModel := self newWithProgrammableScenario 
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60->80;
		activeControl: #step:;
		initSimulation.

	
	(CMPharoGridSimulation new on: aModel withCells: aModel theCMFireAutomataCells withSituatedEntities: aModel theCMFiremans) 
		runAndVisualize.
		
	