Class {
	#name : #CMBushmeatHuntingFamily,
	#superclass : #CMGroup,
	#instVars : [
		'families',
		'maximumAllowedAnthelopePerFamily',
		'maximumNumberAllowedGlobalTraps',
		'traps',
		'space'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatHuntingFamily class >> asGetterForEntityClass [

	^ #huntingFamilies

]

{ #category : #testing }
CMBushmeatHuntingFamily >> currentTrapNumber [
	
	^ self traps size
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> families [

	^ families
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> families: arg1 [

	families := arg1
]

{ #category : #testing }
CMBushmeatHuntingFamily >> hasTrap [
	" Answer <true> if the receiver contains at least one trap "

	^ traps notNil and: [ traps notEmpty ]
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> initialize [

	super initialize.
	self setupTraps.

]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumAllowedAnthelopePerFamily [

	^ maximumAllowedAnthelopePerFamily
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumAllowedAnthelopePerFamily: arg1 [

	maximumAllowedAnthelopePerFamily := arg1
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> maximumAllowedTrapsPerCell [

	^ CMBushmeatHuntingModel maximumAllowedTrapsPerCell 

]

{ #category : #initialization }
CMBushmeatHuntingFamily >> maximumNumberAllowedGlobalTraps [

	^ CMBushmeatHuntingModel maximumNumberAllowedGlobalTraps 

]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumNumberAllowedGlobalTraps: arg1 [

	maximumNumberAllowedGlobalTraps := arg1
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> setupNewTrap [

	traps add: (CMTrap 
		forFamily: self
		location: self chooseTrapLocation)
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> setupTraps [

	[ self currentTrapNumber <= self maximumAllowedTrapsPerCell and: [ 
		self currentTrapNumber <= self maximumNumberAllowedGlobalTraps ] ]
			whileTrue: [ self setupNewTrap ]
		
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> space [

	^ space
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> space: aCMSpaceModel [ 
	space := aCMSpaceModel
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps [

	^ traps
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps: arg1 [

	traps := arg1
]
