Class {
	#name : #CMTestCell,
	#superclass : #CMSpatialEntityCell,
	#category : #'Cormas-Tests-Model'
}

{ #category : #init }
CMTestCell >> initAlive [
	self state: #alive
]

{ #category : #init }
CMTestCell >> initDead [
	self state: #dead
]

{ #category : #init }
CMTestCell >> initRandom [
	self
		state:
			(Cormas random < 0.1
				ifTrue: [ #alive ]
				ifFalse: [ #dead ])
]

{ #category : #control }
CMTestCell >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self state = #dead
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]
