examples
example8
	"Example using OpenMole"
    | conf aModel |
	 self createInJSONFile.
    conf := CMOpenMoleExchange loadJSONFile: 'input.json'.
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
    CMOpenMoleExchange saveJSONFile: aModel data