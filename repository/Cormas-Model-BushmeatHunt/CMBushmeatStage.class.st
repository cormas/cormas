Class {
	#name : #CMBushmeatStage,
	#superclass : #Object,
	#instVars : [
		'anthelope'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #'instance creation' }
CMBushmeatStage class >> ageDifferenceBetweenSex [

	^ false
]

{ #category : #'instance creation' }
CMBushmeatStage class >> maxAgeLimit [

	self subclassResponsibility
]

{ #category : #'instance creation' }
CMBushmeatStage class >> minAgeLimit [

	self subclassResponsibility
]

{ #category : #'instance creation' }
CMBushmeatStage class >> newFor: aCMBushmeatAnthelope [

	^ self new
		initializeWith: aCMBushmeatAnthelope;
		yourself
]

{ #category : #'instance creation' }
CMBushmeatStage class >> stageFor: aCMBushmeathAnthelope [

	^ self ageDifferenceBetweenSex
		ifTrue: [ aCMBushmeathAnthelope age between: aCMBushmeathAnthelope minAgeLimit and: aCMBushmeathAnthelope maxAgeLimit ]
		ifFalse: [ aCMBushmeathAnthelope age between: self minAgeLimit and: self maxAgeLimit ]
]

{ #category : #'instance creation' }
CMBushmeatStage class >> updateStageFrom: aCMBushmeatAnthelope [
	" Answer a new specific stage matching the conditions of aCMBushmeatAnthelope "

	^ (self subclasses detect: [ : stageSubclass |
			stageSubclass stageFor: aCMBushmeatAnthelope ]) 
				newFor: aCMBushmeatAnthelope
]

{ #category : #accessing }
CMBushmeatStage >> anthelope [

	^ anthelope
]

{ #category : #accessing }
CMBushmeatStage >> anthelope: anObject [

	anthelope := anObject
]

{ #category : #testing }
CMBushmeatStage >> dyingProbability [

	self subclassResponsibility
]

{ #category : #initialization }
CMBushmeatStage >> initializeWith: anAnthelope [

	self anthelope: anAnthelope.
	
]

{ #category : #testing }
CMBushmeatStage >> isDead [

	self isProbablyDying
		ifTrue: [ self anthelope dead: true ].
]

{ #category : #testing }
CMBushmeatStage >> isProbablyDying [

	^ Cormas random < self dyingProbability
]
