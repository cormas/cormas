Class {
	#name : 'CMMockCell',
	#superclass : 'CMCell',
	#traits : 'TCMCellularAutomaton',
	#classTraits : 'TCMCellularAutomaton classTrait',
	#instVars : [
		'timesRemovedFromModel'
	],
	#category : 'Cormas-Mocks',
	#package : 'Cormas-Mocks'
}

{ #category : 'aspects' }
CMMockCell >> aspectDefault: look [

	<aspect>
	self aspectState: look
]

{ #category : 'aspects' }
CMMockCell >> aspectGraves: look [

	<aspect>
	state = #dead ifTrue: [ look tile: #grave ]
]

{ #category : 'aspects' }
CMMockCell >> aspectState: look [

	<aspect>
	look color: (state = #dead
			 ifTrue: [ Color black ]
			 ifFalse: [ Color white ])
]

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

{ #category : 'initialize-release' }
CMMockCell >> removedFromModel [

	super removedFromModel.
	timesRemovedFromModel := self timesRemovedFromModel + 1
]

{ #category : 'accessing' }
CMMockCell >> timesRemovedFromModel [

	^ timesRemovedFromModel ifNil: [ 0 ]
]
