Class {
	#name : 'CMMockCell',
	#superclass : 'CMSpatialEntityCell',
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'init' }
CMMockCell >> initAlive [
	self state: #alive
]

{ #category : 'init' }
CMMockCell >> initDead [
	self state: #dead
]

{ #category : 'init' }
CMMockCell >> initRandom [
	self
		state:
			(self random < 0.4
				ifTrue: [ #alive ]
				ifFalse: [ #dead ])
]

{ #category : 'testing' }
CMMockCell >> isAliveCell [

	^ state = #alive
]

{ #category : 'testing' }
CMMockCell >> isDeadCell [

	^ state = #dead
]

{ #category : 'control' }
CMMockCell >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self isDeadCell
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]

{ #category : 'pov' }
CMMockCell >> pov [

	<pov>
	^ state = #dead
		ifTrue: [ Color black ]
		ifFalse: [ Color white ]
]
