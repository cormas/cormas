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
		initDataStructures;
		"init simulation"
		initSimulation.
		"open interface"
	(CMPharoGridSimulation new
		on: aModel
		with: aModel theCMFireAutomataCells
		and: aModel theCMFiremans) runAndVisualizeWithMenus