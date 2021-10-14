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
CMBushmeatStage class >> newFor: arg1 [

	| tmp1 |
	tmp1 := self new.
	tmp1 initializeWith: arg1.
	^ tmp1 yourself
]

{ #category : #'instance creation' }
CMBushmeatStage class >> stageFor: arg1 [

	^ self ageDifferenceBetweenSex
		  ifTrue: [ 
		  arg1 age between: arg1 minAgeLimit and: arg1 maxAgeLimit ]
		  ifFalse: [ 
		  arg1 age between: self minAgeLimit and: self maxAgeLimit ]
]

{ #category : #'instance creation' }
CMBushmeatStage class >> updateStageFrom: arg1 [

	^ (self subclasses detect: [ :arg2 | arg2 stageFor: arg1 ]) newFor:
		  arg1
]

{ #category : #accessing }
CMBushmeatStage >> anthelope [

	^ anthelope
]

{ #category : #accessing }
CMBushmeatStage >> anthelope: arg1 [

	anthelope := arg1
]

{ #category : #testing }
CMBushmeatStage >> dyingProbability [

	self subclassResponsibility
]

{ #category : #accessing }
CMBushmeatStage >> friendlyName [

	self subclassResponsibility
]

{ #category : #initialization }
CMBushmeatStage >> initializeWith: arg1 [

	self anthelope: arg1
]

{ #category : #testing }
CMBushmeatStage >> isAdult [

	^ false
]

{ #category : #testing }
CMBushmeatStage >> isDead [

	self isProbablyDying ifTrue: [ self anthelope dead: true ]
]

{ #category : #testing }
CMBushmeatStage >> isProbablyDying [

	^ Cormas random < self dyingProbability
]

{ #category : #printing }
CMBushmeatStage >> printOn: aStream [

	aStream
		<< '['
		<< self friendlyName;
		<< ']'
]

{ #category : #testing }
CMBushmeatStage >> sizeOfPOV [

	^ self subclassResponsibility
]
