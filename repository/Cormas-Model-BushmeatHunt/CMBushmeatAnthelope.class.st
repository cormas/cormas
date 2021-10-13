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
CMBushmeatAnthelope >> age: anAString [
	age := anAString
]

{ #category : #control }
CMBushmeatAnthelope >> growth [

	self age: self age + 1.
	self updateMortality.
	self updateBehavior.
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> init [ 

	self dead: false.
	self age: (0 to: 200) atRandom.
	self stage: self updateStage.
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
CMBushmeatAnthelope >> partner: anAString [
	partner := anAString
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
CMBushmeatAnthelope >> stage: anAString [
	stage := anAString
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateBehavior [


]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateMortality [

	self stage isProbablyDying.
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> updateStage [
	" Answer a new random stage between the possible receiver's stages "
	
	^ self stage: (CMBushmeatStage updateStageFrom: self)
]
