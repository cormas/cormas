Class {
	#name : #CMMockCell,
	#superclass : #CMSpatialEntityCell,
	#category : #'Cormas-Mocks'
}

{ #category : #init }
CMMockCell >> initAlive [
	self state: #alive
]

{ #category : #init }
CMMockCell >> initDead [
	self state: #dead
]

{ #category : #init }
CMMockCell >> initRandom [
	self
		state:
			(Cormas random < 0.1
				ifTrue: [ #alive ]
				ifFalse: [ #dead ])
]

{ #category : #control }
CMMockCell >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self state = #dead
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]
