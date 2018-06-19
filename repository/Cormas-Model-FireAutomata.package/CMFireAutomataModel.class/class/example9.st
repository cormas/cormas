examples
example9
	| aModel |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"Parameterize model"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 10;
		percentageOfTrees: 0.60;
		dimensions: 30 -> 30;
		activeControl: #step:;
		initSimulation.
	"open interface"
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theCMFireAutomataCells
		withSituatedEntities: aModel theCMFiremans) runAndVisualizeWithMenus goSlow