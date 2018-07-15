"
TODO
"
Class {
	#name : #CMFireman,
	#superclass : #CMAgentCommLocation,
	#instVars : [
		'agsize'
	],
	#category : 'Cormas-Model-FireAutomata'
}

{ #category : #accessing }
CMFireman >> agsize [
	agsize ifNil: [self agsize: 20].
	^ agsize
]

{ #category : #accessing }
CMFireman >> agsize: anObject [
	agsize := anObject
]

{ #category : #'as yet unclassified' }
CMFireman >> extinctFire [

		self patch state = #fire ifTrue: [self patch state: #empty. self patch bufferState: #empty. ]
]

{ #category : #'as yet unclassified' }
CMFireman >> move [

	| firedNeighbours |
	firedNeighbours := self nearestLocationsVerifying: [:cell | cell state = #fire] withinRadius: 4.
	firedNeighbours isEmpty
		ifTrue: [self randomWalk]
		ifFalse: [
			"self leave."
			self moveTo: (Cormas selectRandomlyFrom: firedNeighbours)
		]
]

{ #category : #'as yet unclassified' }
CMFireman >> pov [
	"^#empty ^#tree ^#fire ^#ash"

	^ Color blue
]

{ #category : #'+ accessing' }
CMFireman >> sizeOfPOV [
^ self agsize
]

{ #category : #'as yet unclassified' }
CMFireman >> step [

	self move.
	self extinctFire.
]
