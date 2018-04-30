examples
example2
	| aModel |
	
	aModel := self newWithProgrammableScenario 
		numberOfFires: 3;
		numberOfFiremen: 2;
		percentageOfTrees: 0.58;
		dimensions: 80->80;
		activeControl: #step:;
		initSimulation.

	
	(CMPharoGridSimulation new on: aModel with: aModel theCMFireAutomataCells) 
		runAndVisualize.
		
	