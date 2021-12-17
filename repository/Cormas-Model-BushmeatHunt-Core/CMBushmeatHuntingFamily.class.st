Class {
	#name : #CMBushmeatHuntingFamily,
	#superclass : #CMGroup,
	#instVars : [
		'traps',
		'space',
		'trapLocationStrategy',
		'familyColor'
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

{ #category : #initialization }
CMBushmeatHuntingFamily >> addNewFamilyTraps [

	self traps add: (CMTrap forFamily: self location: self chooseTrapLocation)
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

{ #category : #accessing }
CMBushmeatHuntingFamily >> currentTrapNumber [

	^ self traps size
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> defaultTrapLocationStrategy [

	^ CMRandomTrapLocationStategy 
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
	" Answer <true> if the receiver contains at least one trap "

	^ traps notNil and: [ traps notEmpty ]
]

{ #category : #initialization }
CMBushmeatHuntingFamily >> initialize [

	super initialize.
	self familyColor: Color random.
]

{ #category : #private }
CMBushmeatHuntingFamily >> maximumAllowedTrapsPerCell [

	^ CMBushmeatHuntingModel maximumAllowedTrapsPerCell
]

{ #category : #private }
CMBushmeatHuntingFamily >> maximumNumberAllowedGlobalTraps [

	^ CMBushmeatHuntingModel maximumNumberAllowedGlobalTraps
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
CMBushmeatHuntingFamily >> setupTraps [
	" Add or update the receiver's traps verifying conditions "

	[ self allowedToAddTraps ] 
		whileTrue: [ self setupFamilyTraps ].
"	self shouldUpdateTrapLocations
		ifTrue: [ self updateFamilyTrapLocations ]"
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> space [

	^ space
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> space: aCMSpaceModel [ 
	space := aCMSpaceModel
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
		ifNil: [ traps := OrderedCollection new ]
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps: arg1 [

	traps := arg1
]
