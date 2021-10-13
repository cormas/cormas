Class {
	#name : #CMBushmeatAnthelope,
	#superclass : #CMAgentLocation,
	#instVars : [
		'age',
		'partner',
		'stage'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatAnthelope class >> asGetterForEntityClass [

	^ #anthelopes
]

{ #category : #accessing }
CMBushmeatAnthelope class >> maxAgeLimit [

	^ SmallInteger maxVal
]

{ #category : #accessing }
CMBushmeatAnthelope >> age [

	^ age
]

{ #category : #accessing }
CMBushmeatAnthelope >> age: arg1 [

	age := arg1
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> init [

	self
		dead: false;
		age: (0 to: 200) atRandom;
		stage: self updateStage
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> init0 [

	super init.
	self dead: false.
	self age: 0.

]

{ #category : #testing }
CMBushmeatAnthelope >> isAdult [

	^ self stage isAdult
]

{ #category : #accessing }
CMBushmeatAnthelope >> maxAgeLimit [

	^ self class maxAgeLimit
]

{ #category : #accessing }
CMBushmeatAnthelope >> minAgeLimit [

	^ self class minAgeLimit
]

{ #category : #accessing }
CMBushmeatAnthelope >> partner [

	^ partner
]

{ #category : #accessing }
CMBushmeatAnthelope >> partner: arg1 [

	partner := arg1
]

{ #category : #pov }
CMBushmeatAnthelope >> povPartner [

	^ Color red
]

{ #category : #pov }
CMBushmeatAnthelope >> povStage [

	^ Color red
]

{ #category : #accessing }
CMBushmeatAnthelope >> stage [

	^ stage
]

{ #category : #accessing }
CMBushmeatAnthelope >> stage: arg1 [

	stage := arg1
]

{ #category : #control }
CMBushmeatAnthelope >> step [

	self
		age: self age + 1;
		updateMortality;
		updateBehavior
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateBehavior [

	
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateMortality [

	self stage isProbablyDying
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateStage [

	^ self stage: (CMBushmeatStage updateStageFrom: self)
]
