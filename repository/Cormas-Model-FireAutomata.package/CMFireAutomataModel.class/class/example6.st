examples
example6
	| aModel |
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
	aModel simManager
		initializeSimulation;
		finalTime: 100;
		runSimulation.
	Transcript
		cr;
		show: 'Number of steps: ' , aModel simManager currentTime asString;
		cr;
		show: 'Number of fires: ' , aModel nbFires asString;
		cr;
		show: 'Number of ashes: ' , aModel nbAshes asString;
		open.
	"aModel inspect"