Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'context',
		'data',
		'activeInitSelector',
		'activeControlSelector',
		'probes',
		'initialParameterValues',
		'hasFixedRandomSeed',
		'shouldReleaseRandomSeedAfterInitialization',
		'simulationRunner'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'time' }
CMSimulation class >> defaultFinalTimeStep [

	^ 100
]

{ #category : 'instance creation' }
CMSimulation class >> for: aModel [

	^ self new
		cormasModel: aModel;
		yourself
]

{ #category : 'settings' }
CMSimulation >> activeControlSelector: aSymbol [

	activeControlSelector := aSymbol
]

{ #category : 'settings' }
CMSimulation >> activeInitSelector: aSymbol [

	activeInitSelector := aSymbol
]

{ #category : 'probes' }
CMSimulation >> activeProbes [

	^ probes select: [ :probe | probe isActive ]
]

{ #category : 'accessing' }
CMSimulation >> cormasModel [
	
	^ cormasModel
]

{ #category : 'accessing' }
CMSimulation >> cormasModel: aModel [

	cormasModel := aModel.
	cormasModel simulationContext: context
]

{ #category : 'accessing' }
CMSimulation >> currentTimeStep [

	^ context currentTimeStep 
]

{ #category : 'accessing' }
CMSimulation >> data [

	^ data
]

{ #category : 'simulation runner - init' }
CMSimulation >> defaultStopCondition [
	"Be careful when modifying the stop condition because it can make the simulation (including the tests) run endlesly"
	^ [ :model |
		model currentTimeStep >=
		self class defaultFinalTimeStep ]
]

{ #category : 'testing' }
CMSimulation >> hasFixedRandomSeed [

	^ hasFixedRandomSeed
]

{ #category : 'testing' }
CMSimulation >> hasFixedRandomSeed: aBoolean [

	hasFixedRandomSeed := aBoolean
]

{ #category : 'accessing' }
CMSimulation >> incrementCurrentTimeStep [

	context currentTimeStep: context currentTimeStep + 1
]

{ #category : 'settings' }
CMSimulation >> initialParameterValues [

	^ initialParameterValues
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	context := CMSimulationContext new.
	
	probes := OrderedCollection new.
	data := OrderedCollection new.
	initialParameterValues := Dictionary new.
	
	hasFixedRandomSeed := false.
	shouldReleaseRandomSeedAfterInitialization := false.
	
	self initializeSimulationRunner
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [

	probes := cormasModel class availableProbes.
	probes do: [ :probe | probe object: cormasModel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeSimulation [
"Purpose: initialize one simulation by performing #activeInitSelector.
Reset the currentTimeStep and the data. Set the randomSeed"
	
	self hasFixedRandomSeed ifFalse: [
		"Choose a new random seed every time the simulation is initialized. If random seed is fixed, then we will always initialize the same scenario"
		context chooseRandomSeedAtRandom ].
	
	self initializeProbes.

	data := OrderedCollection new.

	cormasModel initEntities.

	self setInitialParameters.
	
	cormasModel perform: activeInitSelector.
	self recordData.
	
	shouldReleaseRandomSeedAfterInitialization ifTrue: [ 
		context chooseRandomSeedAtRandom ].
]

{ #category : 'simulation runner - init' }
CMSimulation >> initializeSimulationRunner [

	simulationRunner := CMSimulationProcessRunner new
		cormasSimulation: self;
		stopCondition: self defaultStopCondition
]

{ #category : 'simulation runner - config' }
CMSimulation >> intervalDelay: aNumberOfMilliseconds [

	simulationRunner intervalDelay: aNumberOfMilliseconds
]

{ #category : 'simulation runner - testing' }
CMSimulation >> isSimulationProcessConfigured [

	^ simulationRunner isProcessConfigured
]

{ #category : 'simulation runner - testing' }
CMSimulation >> isSimulationRunning [ 

	^ simulationRunner isSimulationRunning
]

{ #category : 'simulation runner - running' }
CMSimulation >> pause [

	simulationRunner pause
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
]

{ #category : 'settings' }
CMSimulation >> randomSeed: aNumber [

	context randomSeed: aNumber.
	
	"If user calls this method to set the random seed, it means that they want to fix it. Otherwise, if we don't fix it, the new random seed will be selected when the simulation is initialized and this number will be lost"
	self hasFixedRandomSeed: true
	
]

{ #category : 'data' }
CMSimulation >> recordData [

	data add:
		(self activeProbes collect: [ :probe | probe name -> probe value ])
			asDictionary 
]

{ #category : 'simulation runner - running' }
CMSimulation >> resume [

	simulationRunner resume
]

{ #category : 'simulation runner - running' }
CMSimulation >> runAllSteps [

	simulationRunner
		beDefaultSimulation;
		runInBackground 
]

{ #category : 'simulation runner - running' }
CMSimulation >> runAllStepsAfterEachIntervalDo: aBlock [

	simulationRunner
		beSimulationAfterEachIntervalDo: aBlock;
		runInBackground
]

{ #category : 'simulation runner - running' }
CMSimulation >> runStep [
	
	self incrementCurrentTimeStep.
	
	cormasModel perform: activeControlSelector.
	cormasModel removeDestroyedEntities.
	
	self recordData.
]

{ #category : 'initialization' }
CMSimulation >> setInitialParameters [

	self setInitialParametersFor: initialParameterValues keys
]

{ #category : 'initialization' }
CMSimulation >> setInitialParametersFor: aCollectionOfParameters [

	| classes parametersWithoutParent otherParameters |
	
	aCollectionOfParameters ifEmpty: [ ^ self ].
	
	classes := aCollectionOfParameters collect: #receiver.
	
	"Parameters that do not have a parent in the list of parameters. Roots of the tree"
	parametersWithoutParent := aCollectionOfParameters reject: [ :parameter |
		classes includes: parameter receiver superclass ].
	
	otherParameters := aCollectionOfParameters reject: [ :parameter |
		parametersWithoutParent includes: parameter ].
	
	parametersWithoutParent do: [ :parameter |
		parameter value: (initialParameterValues at: parameter) ].
	
	self setInitialParametersFor: otherParameters 
]

{ #category : 'testing' }
CMSimulation >> shouldReleaseRandomSeedAfterInitialization [

	^ shouldReleaseRandomSeedAfterInitialization
]

{ #category : 'testing' }
CMSimulation >> shouldReleaseRandomSeedAfterInitialization: aBoolean [

	shouldReleaseRandomSeedAfterInitialization := aBoolean
]

{ #category : 'as yet unclassified' }
CMSimulation >> simulationContext [

	^ context
]

{ #category : 'simulation runner - config' }
CMSimulation >> stepsPerInterval: aPositiveInteger [

	simulationRunner stepsPerInterval: aPositiveInteger
]

{ #category : 'simulation runner - config' }
CMSimulation >> stopAfterStep: aNumber [
	"A syntactic sugar to provide a stop condition that will stop a simulation after a given number of steps"
	self stopWhen: [ :model | model currentTimeStep >= aNumber ]
]

{ #category : 'simulation runner - config' }
CMSimulation >> stopWhen: aBlock [
	"Provede a one-argument block with a stop condition. The argument is a cormasModel. Be careful when modifying the stop condition because it can make the simulation run endlesly.
	
	Example: self stopWhen: [ :model | model totalBiomass > 100 ]"
	simulationRunner stopCondition: aBlock
]

{ #category : 'enumerating' }
CMSimulation >> whenFinishedDo: aBlock [

	simulationRunner whenFinishedDo: aBlock
]
