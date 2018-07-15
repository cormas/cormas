"
I'm a cell of a Conway's Game of Life.
"
Class {
	#name : #CMConwayCell,
	#superclass : #CMSpatialEntityCell,
	#classVars : [
		'CurrentId'
	],
	#category : 'Cormas-Model-Conway'
}

{ #category : #'pov symbols' }
CMConwayCell class >> SpatialEntityPOV_alive [
	"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)"
	<pov:#alive>
	^Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
CMConwayCell class >> SpatialEntityPOV_dead [
	"Returns an array containing the settings of a Spatial entity pov symbol in the following order:
(color red) (color green) (color blue)"
	<pov:#dead>
	^Array with: 0.0 with: 0.0 with: 0.0
]

{ #category : #'- default value' }
CMConwayCell class >> state_default [
	"Return the default value of state attribute"
	
	^nil
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
	" 10 % to be dead"

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
	| nbOfAlives |
	nbOfAlives := self neighbourhood count: [ :n | n state = #alive ].
	self state = #dead & (nbOfAlives = 3)
		ifTrue: [ ^ self bufferState: #alive ].
	(self state = #alive and: [ nbOfAlives = 2 or: [ nbOfAlives = 3 ] ])
		ifTrue: [ ^ self bufferState: #alive ].
	^ self bufferState: #dead
]

{ #category : #pov }
CMConwayCell >> pdv [
	^ state
]

{ #category : #pov }
CMConwayCell >> pov [
	^ state
]
