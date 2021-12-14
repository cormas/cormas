Class {
	#name : #CMBushmeatFemaleAnthelope,
	#superclass : #CMBushmeatAnthelope,
	#instVars : [
		'gestationLength',
		'newBorns'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatFemaleAnthelope class >> asGetterForEntityClass [

	^ #femaleAnthelopes
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope class >> minAgeLimit [

	^ 72
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> addNewborn [

	| newAnthelope |			

	newAnthelope := self class new init0.
	newAnthelope patch: patch.
	self newBorns add: newAnthelope

]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> detailsOfPOV [

	^ String << [ : stream | 
		stream 
			<< super detailsOfPOV; cr;
			<< self offspringDetails ]
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> findPartner [

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

{ #category : #testing }
CMBushmeatFemaleAnthelope >> isFemale [ 

	^ true
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> isPatchingWithAdultMale [

	^ ((patch occupantsType: CMBushmeatMaleAnthelope) anySatisfy: [ :arg1 | 
		   arg1 age < 21 ]) not
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> newBorns [

	^ newBorns
		ifNil: [ newBorns := OrderedCollection new ]
]

{ #category : #printing }
CMBushmeatFemaleAnthelope >> offspringDetails [
	" Answer a <String> with offspring details of the receiver "
	
	^ String << [ : stream | 
		stream
			space;
			<< ' - ';
			<< 'Gest(';
			<< self gestationLength asString;
			<< ')';
			space;
			<< 'New borns: [';
			<< self newBorns size asString;
			<< ']' ]
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> pov [

	^ Color pink
]

{ #category : #pov }
CMBushmeatFemaleAnthelope >> povColor [

	^ Color pink
]

{ #category : #accessing }
CMBushmeatFemaleAnthelope >> pregnancyTime [

	^ 30
]

{ #category : #printing }
CMBushmeatFemaleAnthelope >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	aStream << self offspringDetails
]

{ #category : #printing }
CMBushmeatFemaleAnthelope >> sexString [

	^ 'Female'
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> updateBehavior [

	super updateBehavior.
	self isDead ifFalse: [ self updateGestationBehavior ]
]

{ #category : #'population dynamics' }
CMBushmeatFemaleAnthelope >> updateGestationBehavior [

	self gestationLength > 0 ifTrue: [ 
		gestationLength := gestationLength + 1 ].
	gestationLength = self pregnancyTime
		ifTrue: [ 
			gestationLength := 0.
			self addNewborn ]
		ifFalse: [ 
			(self hasPartner and: [ gestationLength = 0 and: [ self isPatchingWithAdultMale ] ]) 
				ifTrue: [ gestationLength := 1 ] ]
]
