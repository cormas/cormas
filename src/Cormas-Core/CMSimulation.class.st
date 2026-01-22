Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'randomSeed',
		'cormasModel',
		'data',
		'activeInitSelector',
		'activeControlSelector',
		'probes',
		'initialParameterValues',
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
CMSimulation class >> for: aModelClass [

	^ self new
		modelClass: aModelClass;
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
CMSimulation >> currentTimeStep [

	^ cormasModel currentTimeStep 
]

{ #category : 'accessing' }
CMSimulation >> data [

	^ data
]

{ #category : 'running' }
CMSimulation >> defaultStopCondition [
	"Be careful when modifying the stop condition because it can make the simulation (including the tests) run endlesly"
	^ [ :model | model currentTimeStep >= self class defaultFinalTimeStep ]
]

{ #category : 'settings' }
CMSimulation >> initialParameterValues [

	^ initialParameterValues
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	
	probes := OrderedCollection new.
	data := OrderedCollection new.
	initialParameterValues := Dictionary new.
	
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

	cormasModel := modelClass new.
	
	randomSeed ifNotNil: [
		cormasModel randomSeed: randomSeed ].
	
	self initializeProbes.

	data := OrderedCollection new.

"	self initializeModel."
	cormasModel initEntities.

	self setInitialParameters.
	
	cormasModel perform: activeInitSelector.
	self recordData.
	
	shouldReleaseRandomSeedAfterInitialization ifTrue: [ 
		cormasModel randomSeed: cormasModel chooseRandomSeedAtRandom ].
]

{ #category : 'running' }
CMSimulation >> initializeSimulationRunner [

	simulationRunner := CMSimulationProcessRunner new
		cormasSimulation: self;
		stopCondition: self defaultStopCondition
]

{ #category : 'testing' }
CMSimulation >> isSimulationProcessConfigured [

	^ simulationRunner isProcessConfigured
]

{ #category : 'testing' }
CMSimulation >> isSimulationRunning [ 

	^ simulationRunner isSimulationRunning
]

{ #category : 'initialization' }
CMSimulation >> modelClass: aClass [

	modelClass := aClass
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
]

{ #category : 'settings' }
CMSimulation >> randomSeed: aNumber [

	randomSeed := aNumber
]

{ #category : 'data' }
CMSimulation >> recordData [

	data add:
		(self activeProbes collect: [ :probe | probe name -> probe value ])
			asDictionary 
]

{ #category : 'running' }
CMSimulation >> runAllSteps [

	simulationRunner
		beDefaultSimulation;
		runInBackground 
]

{ #category : 'running' }
CMSimulation >> runAllStepsAfterEach: aNumberOfSteps do: aBlock [

	simulationRunner
		beSimulationAfterEach: aNumberOfSteps do: aBlock;
		runInBackground
]

{ #category : 'running' }
CMSimulation >> runAllStepsAfterEachDo: aBlock [

	simulationRunner
		beSimulationAfterEachDo: aBlock;
		runInBackground
]

{ #category : 'running' }
CMSimulation >> runStep [
	
	cormasModel incrementCurrentTimeStep.
	
	self flag: 'TODO'.
	"TODO: Discuss this. We can either keep the currentTimeStep as attribute of a model, but then there is no need to pass it as parameter to the step method. Or we can move it to the simulation class and then pass it as parameter (perhaps, it would malke sense to always pass it as parameter to the step method)"
	activeControlSelector last = $:
		ifTrue: [ cormasModel perform: activeControlSelector with: cormasModel currentTimeStep ]
		ifFalse: [ cormasModel perform: activeControlSelector ].
		
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
CMSimulation >> shouldReleaseRandomSeedAfterInitialization: aBoolean [

	shouldReleaseRandomSeedAfterInitialization := aBoolean
]

{ #category : 'accessing' }
CMSimulation >> simulationRunner [

	^ simulationRunner
]

{ #category : 'as yet unclassified' }
CMSimulation >> stopAfterStep: aNumber [
	"A syntactic sugar to provide a stop condition that will stop a simulation after a given number of steps"
	self stopWhen: [ :model | model currentTimeStep >= aNumber ]
]

{ #category : 'as yet unclassified' }
CMSimulation >> stopWhen: aBlock [
	"Provede a one-argument block with a stop condition. The argument is a cormasModel. Be careful when modifying the stop condition because it can make the simulation run endlesly.
	
	Example: self stopWhen: [ :model | model totalBiomass > 100 ]"
	simulationRunner stopCondition: aBlock
]
