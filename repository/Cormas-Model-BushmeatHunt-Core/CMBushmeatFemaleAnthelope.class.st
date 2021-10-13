Class {
	#name : #CMBushmeatFemaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#instVars : [
		'gestationLength'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatFemaleAnthelope class >> minAgeLimit [

	^ 72
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> gestationLength [

	^ 30
]

{ #category : #'initialize - release' }
CMBushmeatFemaleAnthelope >> init0 [

	super init0.
	gestationLength := 0.
]

{ #category : #testing }
CMBushmeatFemaleAnthelope >> isMature [

	^ self age > 72
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> pov [

	^ Color pink
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> pregnancyTime [

	^ 30
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> updateBehavior [ 

	super updateBehavior.
	self updateGestationBehavior.
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> updateGestationBehavior [

	| petit |

	self gestationLength > 0 
		ifTrue: [ gestationLength := gestationLength + 1 ].
	gestationLength = self pregnancyTime 
		ifTrue: [
			gestationLength := 0.
			petit := self class new init0.
			petit patch: patch ]
		ifFalse: [
			(partner notNil and: [ gestationLength = 0 and: [((patch theOccupants at: self class name) anySatisfy: [:a | a age < 21]) not]])
				ifTrue: [ gestationLength := 1 ] ].
]
