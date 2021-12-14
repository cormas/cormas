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
CMBushmeatStage class >> newFor: anAnthelope [

	^ self new
		initializeWith: anAnthelope;
		yourself
]

{ #category : #'instance creation' }
CMBushmeatStage class >> stageFor: arg1 [

	^ self ageDifferenceBetweenSex
		  ifTrue: [  arg1 age between: arg1 minAgeLimit and: arg1 maxAgeLimit ]
		  ifFalse: [ arg1 age between: self minAgeLimit and: self maxAgeLimit ]
]

{ #category : #'instance creation' }
CMBushmeatStage class >> updateStageFrom: anAnthelope [
	" Answer a new receiver's instance for anAnthelope "
	
	(self subclasses 
		detect: [ : stageSubclass | stageSubclass stageFor: anAnthelope ]
		ifFound: [ : stageSubclass | 
			^ anAnthelope stage class = stageSubclass
				ifTrue: [ anAnthelope stage ]
				ifFalse: [ stageSubclass newFor: anAnthelope ] ]) 
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
CMBushmeatStage >> initializeWith: anAnthelope [

	self anthelope: anAnthelope
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
CMBushmeatStage >> isNewborn [ 

	^ false
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

	^ self dyingProbability * 500
]

{ #category : #testing }
CMBushmeatStage >> updateLivingStatus [

	self isProbablyDying 
		ifTrue: [ self anthelope delete ]
]
