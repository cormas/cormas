examples
example2_OM
    | conf aModel |
	 self createInJSONFile.
    conf := CmOpenMoleExchange loadJSONFile: 'in.json'.
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
    CmOpenMoleExchange saveJSONFile: aModel data