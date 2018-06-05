examples
example9
	| aModel probes |
	"set model configuration"
	aModel := self initialize new.
	aModel
		activeInit: #init58WithFireWithFiremen;
		" #initWithProgrammableScenario;"
			numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:.
	"set probes configuration (probes to save)"
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbFires'.
	probes add: 'CMFireAutomataModel>>nbAshes'.
	aModel class setActiveProbes: probes.
	aModel simManager
		initializeSimulation;
		finalTime: 100.
	CMSimpleChart openOn: aModel.
	aModel simManager loopRunStep_untilFinalTime