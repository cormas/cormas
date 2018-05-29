examples
example2_OM
	| conf aModel |
	conf := CmOpenMoleExchange loadJSONFile: 'truc.json'.
	aModel := self newWithProgrammableScenario
		numberOfFires: (conf at: #numberOfFires) ;
		numberOfFiremen: (conf at: #numberOfFiremen);
		percentageOfTrees: (conf at: #percentageOfTrees);
		dimensions: (conf at: #dimensionMin) -> (conf at: #dimensionMax);
		activeControl: #step:;
		initSimulation.
	aModel simManager
		initializeSimulation;
		finalTime: 100;
		runSimulation.
	(CMSimpleChart newOn: aModel)