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

{ #category : #'instance creation' }
CMBushmeatHuntingFamily class >> newWithId: anInteger forSpace: aCMSpaceModel [ 

	^ self basicNew
		id: anInteger; 
		space: aCMSpaceModel;
		initialize;
		yourself
	
]

{ #category : #testing }
CMBushmeatHuntingFamily >> allowedToAddTraps [
	" Answer <true> if the receiver is allowed to add traps "

	^ self currentTrapNumber <= self maximumAllowedTrapsPerCell and: [ 
		self currentTrapNumber <= self maximumNumberAllowedGlobalTraps ] 
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> chooseTrapLocation [
	" Answer a <Point> which is a coordinate in the range of the receiver's space model "
	
	^ self trapLocationStrategy chooseTrapLocation
]

{ #category : #testing }
CMBushmeatHuntingFamily >> currentTrapNumber [

	^ self traps size
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> defaultTrapLocationStrategy [

	^ CMRandomTrapLocationStategy 
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> families [

	^ families
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> families: arg1 [

	families := arg1
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> familyColor [

	^ familyColor
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> familyColor: anObject [

	familyColor := anObject
]

{ #category : #testing }
CMBushmeatHuntingFamily >> hasTrap [

	^ traps notNil and: [ traps notEmpty ]
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> initialize [

	super initialize.
	self setupTraps
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

{ #category : #accessing }
CMBushmeatHuntingFamily >> removeTraps [

	self traps do: #removeTrap
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> setupFamilyTraps [

	self traps add: (CMTrap forFamily: self location: self chooseTrapLocation)
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> setupNewTrap [

	traps add: (CMTrap forFamily: self location: self chooseTrapLocation)
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> setupTraps [

	[ 
	self currentTrapNumber <= self maximumAllowedTrapsPerCell and: [ 
		self currentTrapNumber <= self maximumNumberAllowedGlobalTraps ] ] 
		whileTrue: [ self setupNewTrap ]
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> space [

	^ space
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> space: arg1 [

	space := arg1
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> trapLocationStrategy [

	^ trapLocationStrategy
		ifNil: [ trapLocationStrategy := self defaultTrapLocationStrategy newFor: self ]
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> trapLocationStrategy: anObject [

	trapLocationStrategy := anObject
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps [

	^ traps
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps: arg1 [

	traps := arg1
]
