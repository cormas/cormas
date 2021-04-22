"
I'm a cell of a Conway's Game of Life.
"
Class {
	#name : #CMConwayCell,
	#superclass : #CMSpatialEntityCell,
	#classVars : [
		'CurrentId'
	],
	#category : #'Cormas-Model-Conway'
}

{ #category : #'pov symbols' }
CMConwayCell class >> SpatialEntityPOV_alive [
	<pov: #alive>
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMConwayCell class >> SpatialEntityPOV_dead [
	<pov: #dead>
	^ Array with: 0.0 with: 0.0 with: 0.0
]

{ #category : #'pov symbols' }
CMConwayCell class >> SpatialEntityPOV_dead_red [
	<pov: #dead_red>
	^ Array with: 0.5 with: 0.0 with: 0.1
]

{ #category : #'default value' }
CMConwayCell class >> state_default [
	^ nil
]

{ #category : #init }
CMConwayCell >> initAllDead [
	self state: #dead
]

{ #category : #init }
CMConwayCell >> initRandomly [
	Cormas random < 0.5
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #init }
CMConwayCell >> initTen [
	Cormas random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #init }
CMConwayCell >> initTenPercentDead [
	Cormas random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #probes }
CMConwayCell >> isAlive [
	self state = #alive
		ifTrue: [ ^ 1 ].
	^ 0
]

{ #category : #control }
CMConwayCell >> newState [
	| tmp1 |
	tmp1 := self neighbourhood count: [ :arg1 | arg1 state = #alive ].
	self state = #dead & (tmp1 = 3)
		ifTrue: [ ^ self bufferState: #alive ].
	(self state = #alive and: [ tmp1 = 2 or: [ tmp1 = 3 ] ])
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]

{ #category : #pov }
CMConwayCell >> pdv [
	^ state
]

{ #category : #pov }
CMConwayCell >> pov [
	^ self state
]

{ #category : #pov }
CMConwayCell >> pov_red [
	self state = #dead
		ifTrue: [ ^ #dead_red ].
	^ self state
]
