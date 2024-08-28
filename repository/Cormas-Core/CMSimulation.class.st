Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'cormasModel',
		'randomSeed',
		'currentTimeStep',
		'data',
		'finalTimeStep',
		'activeInitMethod',
		'activeControlMethod',
		'probes',
		'initialParameterValues'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'time' }
CMSimulation class >> defaultFinalTimeStep [
	"Answer an <Integer> representing the default final time step"

	^ 100
]

{ #category : 'instance creation' }
CMSimulation class >> for: aModelClass [

	^ self new
		modelClass: aModelClass;
		yourself
]

{ #category : 'accessing' }
CMSimulation >> activeControlMethod: aCompiledMethod [

	activeControlMethod := aCompiledMethod
]

{ #category : 'accessing' }
CMSimulation >> activeInitMethod: aCompiledMethod [

	activeInitMethod := aCompiledMethod
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

	^ currentTimeStep 
]

{ #category : 'accessing' }
CMSimulation >> data [

	^ data
]

{ #category : 'accessing' }
CMSimulation >> finalTimeStep [

	^ finalTimeStep
]

{ #category : 'accessing' }
CMSimulation >> finalTimeStep: anInteger [

	finalTimeStep := anInteger
	
]

{ #category : 'time step' }
CMSimulation >> finishSimulation [

	currentTimeStep := self finalTimeStep
]

{ #category : 'testing' }
CMSimulation >> hasEnded [
	
	^ self finalTimeStep <= self currentTimeStep
]

{ #category : 'accessing' }
CMSimulation >> initialParameterValues [

	^ initialParameterValues
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	
	"By default random seed is a random number but we still store it to ensure reproducibility"
	randomSeed := Random new nextInteger: SmallInteger maxVal.
	
	currentTimeStep := 0.
	finalTimeStep := self class defaultFinalTimeStep.
	
	probes := OrderedCollection new.
	data := OrderedCollection new.
	initialParameterValues := Dictionary new.
]

{ #category : 'initialization' }
CMSimulation >> initializeModel [

	cormasModel := modelClass new
		randomSeed: randomSeed;
		yourself.
		
	self initializeProbes.

	"remove the previous entities of the collections (theXXXs), except for theCells"
	cormasModel initEntities.

	cormasModel removeDestroyedEntities.
	cormasModel channel ifNil: [ cormasModel initializeChannel ].
	cormasModel theAgentsComm do: [ :p | p channel: cormasModel channel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [

	probes := cormasModel class availableProbes.
	probes do: [ :probe | probe object: cormasModel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeSimulation [

	self initializeModel.

	initialParameterValues keysAndValuesDo: [ :parameter :value |
		parameter value: value ].
	
	activeInitMethod valueWithReceiver: cormasModel.
	self recordData.
]

{ #category : 'accessing' }
CMSimulation >> modelClass: aClass [
	"Model will be instantiated by the initializeSimulation method"
	
	modelClass := aClass
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
]

{ #category : 'accessing' }
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

	self runAllStepsAfterEachDo: [ "nothing" ]
]

{ #category : 'running' }
CMSimulation >> runAllStepsAfterEach: aNumberOfSteps do: aBlock [

	[ currentTimeStep < finalTimeStep ] whileTrue: [
		(aNumberOfSteps min: (finalTimeStep - currentTimeStep))
			timesRepeat: [ self runStep ].
			
		aBlock value ]
]

{ #category : 'running' }
CMSimulation >> runAllStepsAfterEachDo: aBlock [

	[ currentTimeStep < finalTimeStep ] whileTrue: [
		self runStep.
		aBlock value ]
]

{ #category : 'running' }
CMSimulation >> runAllStepsWithStepDelay: milliseconds [

	self runAllStepsWithStepDelay: milliseconds afterEachDo: [ "nothing" ]
]

{ #category : 'running' }
CMSimulation >> runAllStepsWithStepDelay: milliseconds afterEach: aNumberOfSteps do: aBlock [

	[ [ currentTimeStep < finalTimeStep ] whileTrue: [
		(aNumberOfSteps min: (finalTimeStep - currentTimeStep))
			timesRepeat: [ self runStep ].
			
		aBlock value.
		(Delay forMilliseconds: milliseconds) wait ] ] fork.
]

{ #category : 'running' }
CMSimulation >> runAllStepsWithStepDelay: milliseconds afterEachDo: aBlock [

	[ [ currentTimeStep < finalTimeStep ] whileTrue: [
		self runStep.
		aBlock value.
		(Delay forMilliseconds: milliseconds) wait ] ] fork.
]

{ #category : 'running' }
CMSimulation >> runStep [
	"The main step method that activates the agents:
		- INCREMENT the timeStep (DO NOT USE the #incrementTimeStep as updates the UI before agents get a new patch)
		- EXECUTE the selected #Step method (of the ScenarioBuilder Interface) for the new timeStep,
		- UPDATE the Entities (remove the dead ones and add the new ones in theXXs collections).
	(For display: Store the changed entities in a collection and request an update of the space views at the end of the timestep)"
	
	currentTimeStep := currentTimeStep + 1.
	
	activeControlMethod selector last = $:
		ifTrue: [ activeControlMethod valueWithReceiver: cormasModel arguments: { currentTimeStep } ]
		ifFalse: [ activeControlMethod valueWithReceiver: cormasModel ].
		
	cormasModel removeDestroyedEntities.
	cormasModel channel ifNotNil: [ cormasModel channel sendAllMessages ].
	
	self recordData.
]
