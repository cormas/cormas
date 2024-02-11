Class {
	#name : #CMMockAnimal,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'energy'
	],
	#category : #'Cormas-Mocks'
}

{ #category : #initialization }
CMMockAnimal >> initialize [

	super initialize.
	energy := 0.5
]

{ #category : #pov }
CMMockAnimal >> sizeOfPOV [

	^ 2 + (energy * 10)
]

{ #category : #control }
CMMockAnimal >> step [
	
	self randomWalk
]
