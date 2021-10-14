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

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> findPartner [
	" do nothing "
	
	^ nil
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> gestationLength [

	^ gestationLength
		  ifNil: [ gestationLength := 0 ]
		  ifNotNil: [ gestationLength ]
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> gestationLength: arg1 [

	gestationLength := arg1
]

{ #category : #'initialize - release' }
CMBushmeatFemaleAnthelope >> init0 [

	super init0.
	gestationLength := 0
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> isPatchingWithAdultMale [

	^ ((patch occupantsType: CMBushmeatMaleAnthelope) anySatisfy: [ :arg1 | 
		   arg1 age < 21 ]) not
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> pov [

	^ Color pink
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> pregnancyTime [

	^ 30
]

{ #category : #printing }
CMBushmeatFemaleAnthelope >> printOn: aStream [

	super printOn: aStream.
	aStream 
		space;
		<< ' - ';
		<< 'Gest(';
		<< self gestationLength asString;
		<< ')'.
]

{ #category : #printing }
CMBushmeatFemaleAnthelope >> sexString [

	^ 'Female'
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> updateBehavior [

	super updateBehavior.
	self updateGestationBehavior
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> updateGestationBehavior [

	self gestationLength > 0 ifTrue: [ 
		gestationLength := gestationLength + 1 ].
	gestationLength = self pregnancyTime
		ifTrue: [ 
			| newAnthelope |
			gestationLength := 0.
			newAnthelope := self class new init0.
			newAnthelope patch: patch ]
		ifFalse: [ 
			(self hasPartner and: [ gestationLength = 0 and: [ self isPatchingWithAdultMale ] ]) 
				ifTrue: [ gestationLength := 1 ] ]
]
