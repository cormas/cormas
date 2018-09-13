"
A stupide agent
"
Class {
	#name : #CMStupideAgent,
	#superclass : #CMAgentLocation,
	#instVars : [
		'agsize'
	],
	#category : #'Cormas-Model-Stupid'
}

{ #category : #accessing }
CMStupideAgent >> agsize [
	^ agsize ifNil: [ agsize := 20 ]
]

{ #category : #accessing }
CMStupideAgent >> agsize: anObject [
	agsize := anObject
]

{ #category : #growth }
CMStupideAgent >> gowing [

	self agsize: (self agsize  + self patch food).
	self patch food: 0 .
]

{ #category : #running }
CMStupideAgent >> move [
	"move to an empty cell... if not don't move"

	self randomWalkConstrainedBy: [
			:c | c noOccupant 
		].
]

{ #category : #pov }
CMStupideAgent >> pov [

	^ Color blue
]

{ #category : #pov }
CMStupideAgent >> sizeOfPOV [
^ self agsize
]

{ #category : #scheduling }
CMStupideAgent >> step [

	self move.
	self gowing.
]
