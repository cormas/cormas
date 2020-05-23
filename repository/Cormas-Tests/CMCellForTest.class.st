Class {
	#name : #CMCellForTest,
	#superclass : #CMSpatialEntityCell,
	#category : #'Cormas-Tests-Model'
}

{ #category : #'as yet unclassified' }
CMCellForTest >> initAlive [
	self state: #alive
]

{ #category : #'as yet unclassified' }
CMCellForTest >> initDead [
	self state: #dead
]

{ #category : #'as yet unclassified' }
CMCellForTest >> initRandom [
	self
		state:
			(Cormas random < 0.1
				ifTrue: [ #alive ]
				ifFalse: [ #dead ])
]

{ #category : #control }
CMCellForTest >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self state = #dead
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]
