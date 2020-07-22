Class {
	#name : #ReHab,
	#superclass : #CMAbstractModel,
	#instVars : [
		'nbFamilies',
		'theBirds',
		'thePlantHarvesters',
		'theFamilys',
		'theParkManagers',
		'birdNewborns',
		'theZones',
		'theBlinds',
		'theMaximizers',
		'theLoneRiders',
		'theStrategy_ParkManagers',
		'strategy_Family',
		'poaching',
		'restrained',
		'theCrusaders',
		'theManagers',
		'strategy_ParkManager',
		'theExplorers'
	],
	#classInstVars : [
		'defaultInit'
	],
	#category : #'Cormas-Model-ReHab'
}

{ #category : #'+ simulation settings' }
ReHab class >> defaultInit [

	^ defaultInit ifNil: [ defaultInit := #init ]
]

{ #category : #accessing }
ReHab class >> defaultInit: aSelector [

	defaultInit := aSelector
]

{ #category : #'instance creation' }
ReHab class >> newWithProgrammableScenario [
"the way to init a scenraio for OpenMole"
<openMole>
	^ self 
		defaultInit: #initWithProgrammableScenario;
		initialize;
		new.
]

{ #category : #examples }
ReHab class >> simuOpenMole [
	"Example used in OpenMole (https://openmole.org/)"
	<openMole>
    | conf aModel |
	 "self createInJSONFile." "OpenMole usually generate this file"
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
    CMOpenMoleExchange saveJSONFile: (self lastValuesOfVariables: (aModel data))
]
