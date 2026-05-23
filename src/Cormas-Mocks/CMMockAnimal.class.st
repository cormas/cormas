Class {
	#name : 'CMMockAnimal',
	#superclass : 'CMAgent',
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
	<parameterFloat: 'Initial energy' min: 0 max: 1 step: 0.1 default: 0.5>
	^ initialEnergy
]

{ #category : 'accessing' }
CMMockAnimal class >> initialEnergy: aNumber [

	initialEnergy := aNumber
]

{ #category : 'initialization' }
CMMockAnimal >> initialize [

	super initialize.
	energy := self class initialEnergy
]

{ #category : 'pov' }
CMMockAnimal >> pov [

	^ CMPointOfView size: 0.3 + (energy * 0.1)
]

{ #category : 'control' }
CMMockAnimal >> step [
	
	self randomWalk
]
