examples
example4
	| aModel |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"Parameterize model"
	aModel := self newWithProgrammableScenario
		numberOfFires: 3;
		numberOfFiremen: 20;
		percentageOfTrees: 0.60;
		dimensions: 60 -> 80;
		activeControl: #step:;
		initSimulation.
	"open interface"
	(CMSimulationGrid new
		on: aModel
		withCells: aModel theCMFireAutomataCells
		withSituatedEntities: aModel theCMFiremans) runAndVisualizeWithMenus