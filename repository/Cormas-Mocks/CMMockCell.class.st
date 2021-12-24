Class {
	#name : #CMMockCell,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'mockAttribute1',
		'mockAttribute2'
	],
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

{ #category : #accessing }
CMMockCell >> mockAttribute1 [

	^ mockAttribute1
]

{ #category : #accessing }
CMMockCell >> mockAttribute1: anObject [

	mockAttribute1 := anObject
]

{ #category : #accessing }
CMMockCell >> mockAttribute2 [

	^ mockAttribute2
]

{ #category : #accessing }
CMMockCell >> mockAttribute2: anObject [

	mockAttribute2 := anObject
]

{ #category : #control }
CMMockCell >> newState [
	"Purpose: the specific transition function of the automaton should be written here
Example: self bufferState: (test ifTrue: [value1] ifFalse: [value2])"

	self state = #dead
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]
