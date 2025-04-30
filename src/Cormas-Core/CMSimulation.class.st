Class {
	#name : 'CMSimulation',
	#superclass : 'Object',
	#instVars : [
		'modelClass',
		'cormasModel',
		'randomNumberGenerator',
		'currentRunNumber',
		'currentTimeStep',
		'data',
		'finalTimeStep',
		'activeInitSelector',
		'activeControlSelector',
		'probes',
		'initialParameterValues',
		'shouldReleaseRandomSeedAfterInitialization'
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
		initializeModelClass: aModelClass;
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

	^ currentTimeStep 
]

{ #category : 'accessing' }
CMSimulation >> data [

	^ data
]

{ #category : 'settings' }
CMSimulation >> finalTimeStep [

	^ finalTimeStep
]

{ #category : 'settings' }
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

{ #category : 'settings' }
CMSimulation >> initialParameterValues [

	^ initialParameterValues
]

{ #category : 'initialization' }
CMSimulation >> initialize [

	super initialize.
	
	finalTimeStep := self class defaultFinalTimeStep.
	
	probes := OrderedCollection new.
	data := OrderedCollection new.
	initialParameterValues := Dictionary new.
	
	shouldReleaseRandomSeedAfterInitialization := false
]

{ #category : 'initialization' }
CMSimulation >> initializeModelClass: aClass [

	cormasModel := aClass new.
	self initializeProbes
]

{ #category : 'initialization' }
CMSimulation >> initializeProbes [

	probes := cormasModel class availableProbes.
	probes do: [ :probe | probe object: cormasModel ].
]

{ #category : 'initialization' }
CMSimulation >> initializeSimulation [

	currentTimeStep := 0.
	data := OrderedCollection new.

	self setInitialParameters.
	
	cormasModel perform: activeInitSelector.
	self recordData.
	
	shouldReleaseRandomSeedAfterInitialization ifTrue: [ 
		cormasModel randomSeed: cormasModel chooseRandomSeedAtRandom ].
]

{ #category : 'accessing' }
CMSimulation >> probes [

	^ probes
]

{ #category : 'settings' }
CMSimulation >> randomSeed: aNumber [

	cormasModel randomSeed: aNumber
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
	
	currentTimeStep := currentTimeStep + 1.
	
	activeControlSelector last = $:
		ifTrue: [ cormasModel perform: activeControlSelector with: currentTimeStep ]
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
