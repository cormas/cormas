Class {
	#name : 'CMMockAnimal',
	#superclass : 'CMAgent',
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'energy'
	],
	#classInstVars : [
		'initialEnergy'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'accessing' }
CMMockAnimal class >> initialEnergy [

	^ initialEnergy
]

{ #category : 'accessing' }
CMMockAnimal class >> initialEnergy: aNumber [

	initialEnergy := aNumber
]

{ #category : 'initialization' }
CMMockAnimal class >> initializeParameters [

	super initializeParameters.
	initialEnergy := 0.5
]

{ #category : 'initialization' }
CMMockAnimal >> initialize [

	super initialize.
	energy := self class initialEnergy
]

{ #category : 'pov' }
CMMockAnimal >> sizeOfPOV [

	^ 2 + (energy * 10)
]

{ #category : 'control' }
CMMockAnimal >> step [
	
	self randomWalk
]
