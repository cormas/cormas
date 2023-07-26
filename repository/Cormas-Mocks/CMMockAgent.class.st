Class {
	#name : #CMMockAgent,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'energy'
	],
	#category : #'Cormas-Mocks'
}

{ #category : #initialization }
CMMockAgent >> initialize [

	super initialize.
	energy := Cormas randomFloatFrom: 0 to: 1 
]

{ #category : #pov }
CMMockAgent >> pov [

	^ Color red
]

{ #category : #pov }
CMMockAgent >> sizeOfPOV [

	^ 2 + (energy * 10)
]

{ #category : #control }
CMMockAgent >> step [
	
]
