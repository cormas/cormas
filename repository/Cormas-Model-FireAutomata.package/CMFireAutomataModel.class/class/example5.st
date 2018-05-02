examples
example5
	| aModel probes |
	"reset probes saving specification"
	self setActiveProbes: OrderedCollection new.
	"set model configuration"
	aModel := self newWithProgrammableScenario
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
	"Init simulation"	
	aModel initSimulation.
"create view that control the model and enables visualisation of non dynamic charts"		
	(CMPharoGridSimulation new
		on: aModel
		with: aModel theCMFireAutomataCells
		and: aModel theCMFiremans) runAndVisualizeWithMenus.