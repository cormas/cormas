"
I provide shared execution state and services for a simulation run.

A simulation context is created and owned by a CMSimulation and is shared with the model and all entities created during the simulation. It provides access to information such as the current time step, random number generator, and other run-level services.

My purpose is to make shared simulation resources available without introducing direct dependencies between entities, the model, and the simulation itself.
"
Class {
	#name : 'CMSimulationContext',
	#superclass : 'Object',
	#instVars : [
		'randomNumberGenerator',
		'randomSeed',
		'currentTimeStep'
	],
	#category : 'Cormas-Core-Kernel',
	#package : 'Cormas-Core',
	#tag : 'Kernel'
}

{ #category : 'as yet unclassified' }
CMSimulationContext class >> defaultRandomNumberGeneratorClass [

	^ PMFishmanMooreRandomGenerator
]

{ #category : 'random numbers' }
CMSimulationContext >> chooseRandomSeedAtRandom [

	self randomSeed: (Random new nextInteger: SmallInteger maxVal)
]

{ #category : 'accessing' }
CMSimulationContext >> currentTimeStep [

	^ currentTimeStep
]

{ #category : 'accessing' }
CMSimulationContext >> currentTimeStep: anObject [

	currentTimeStep := anObject
]

{ #category : 'initialization' }
CMSimulationContext >> initialize [

	super initialize.
	currentTimeStep := 0.
	
	self initializeRandomNumberGenerator
]

{ #category : 'initialization' }
CMSimulationContext >> initializeRandomNumberGenerator [
	
	randomNumberGenerator := self class defaultRandomNumberGeneratorClass new.
	self chooseRandomSeedAtRandom
]

{ #category : 'accessing' }
CMSimulationContext >> randomNumberGenerator [

	^ randomNumberGenerator
]

{ #category : 'accessing' }
CMSimulationContext >> randomNumberGenerator: anObject [

	randomNumberGenerator := anObject
]

{ #category : 'accessing' }
CMSimulationContext >> randomSeed [

	^ randomSeed
]

{ #category : 'accessing' }
CMSimulationContext >> randomSeed: anObject [

	randomSeed := anObject.
	
	"Some random number generators confuse seed and state and modify the seed value every time they generate a random number. To make sure that the initial seed is retained, we store it separately in the randomSeed variable before passign it to the generator"
	randomNumberGenerator seed: anObject
]
