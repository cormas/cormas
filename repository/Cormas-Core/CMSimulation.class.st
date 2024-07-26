Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'cormasModel',
		'currentTimeStep',
		'data',
		'finalTimeStep',
		'activeInitMethod',
		'activeControlMethod',
		'probes'
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
CMSimulation class >> for: aModel [

	^ self new
		cormasModel: aModel;
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

{ #category : 'available methods' }
CMSimulation >> availableControlMethods [

	^ (Pragma allNamed: #control in: cormasModel class) collect: #method
]

{ #category : 'available methods' }
CMSimulation >> availableInitMethods [

	^ (Pragma allNamed: #init in: cormasModel class) collect: #method
]

{ #category : 'accessing' }
CMSimulation >> cormasModel [
	
	^ cormasModel
]

{ #category : 'accessing' }
CMSimulation >> cormasModel: anObject [
	
	cormasModel := anObject.
	self initializeModel.
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

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	
	currentTimeStep := 0.
	finalTimeStep := self class defaultFinalTimeStep.
	
	probes := OrderedCollection new.
	data := OrderedCollection new.
]

{ #category : 'initialization' }
CMSimulation >> initializeModel [

	self initializeProbes.

	"remove the previous entities of the collections (theXXXs), except for theCells"
	cormasModel initEntities.

	cormasModel removeDestroyedEntities.
	cormasModel channel ifNil: [ cormasModel initializeChannel ].
	cormasModel theAgentsComm do: [ :p | p channel: cormasModel channel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [

	probes := (Pragma allNamed: #probeNamed: in: cormasModel class) collect: [ :pragma |
		CMProbe
			name: pragma arguments first
			method: pragma method
			on: cormasModel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeSimulation [

	activeInitMethod valueWithReceiver: cormasModel.
	self recordData.
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
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
