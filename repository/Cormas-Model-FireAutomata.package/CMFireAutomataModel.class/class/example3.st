examples
example3
	| aModel |
	
	aModel := self newWithProgrammableScenario 
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 80->80;
		activeControl: #step:;
		initSimulation.

	
	(CMPharoGridSimulation new on: aModel with: aModel theCMFireAutomataCells and: aModel theCMFiremans) 
		runAndVisualize.
		
	