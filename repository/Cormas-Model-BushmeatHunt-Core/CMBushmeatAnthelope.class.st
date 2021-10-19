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

	self subclassResponsibility 
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

{ #category : #testing }
CMBushmeatAnthelope >> customShapeSelector [

	^ self hasPartner
		  ifTrue: [ 
			  self halt.
			  #bitmap ]
		  ifFalse: [ #ellipse ]
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> findPartner [

	self subclassResponsibility
]

{ #category : #testing }
CMBushmeatAnthelope >> hasCustomShape [

	^ self hasPartner
]

{ #category : #testing }
CMBushmeatAnthelope >> hasNoPartner [

	^ partner isNil
]

{ #category : #testing }
CMBushmeatAnthelope >> hasPartner [

	^ partner notNil
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> init [

	self
		dead: false;
		age: (0 to: 200) atRandom;
		stage: (CMBushmeatStage updateStageFrom: self)
]

{ #category : #'initialize-release' }
CMBushmeatAnthelope >> init0 [

	super init.
	self
		dead: false;
		age: 0
]

{ #category : #testing }
CMBushmeatAnthelope >> isAdult [

	^ self stage isAdult
]

{ #category : #testing }
CMBushmeatAnthelope >> isAlive [

	^ self isDead not
]

{ #category : #testing }
CMBushmeatAnthelope >> isFemale [ 

	^ false
]

{ #category : #testing }
CMBushmeatAnthelope >> isNewborn [

	^ self stage isNewborn
]

{ #category : #accessing }
CMBushmeatAnthelope >> labelOfPOV [
	" Answer a <Number> to visually distinguish the receiver in a space "

	^ self age asString
]

{ #category : #accessing }
CMBushmeatAnthelope >> maxAgeLimit [

	^ self class maxAgeLimit
]

{ #category : #accessing }
CMBushmeatAnthelope >> minAgeLimit [

	^ self class minAgeLimit
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> move [

	self findPartner
		ifNil: [ self moveToEmptyPlace ]
		ifNotNil: [ : candidateAnthelope |
			partner := candidateAnthelope.
			self moveTo: candidateAnthelope patch.
			partner partner: self ]
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> moveToEmptyPlace [

	 self nearestEmptyLocation
		ifNil: [ ('No empty location for: ' , self id asString) traceCr ]
		ifNotNil: [ : nearestEmptyLoc | self moveTo: nearestEmptyLoc ]
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
CMBushmeatAnthelope >> pov [

	^ self isDead
		  ifTrue: [ Color black ]
		  ifFalse: [ 
				self hasPartner
				  ifTrue: [ Color red ]
				  ifFalse: [ 
						self isNewborn
							ifTrue: [ Color white ]
							ifFalse: [ self povColor ] ] ]
]

{ #category : #printing }
CMBushmeatAnthelope >> printOn: aStream [

	aStream
		<< 'Id: ';
		<< self id asString;
		space;
		<< 'Stage: ';
		<< self stage asString;
		space;
		<< 'Sex: ';
		<< self sexString
]

{ #category : #printing }
CMBushmeatAnthelope >> sexString [

	self subclassResponsibility
]

{ #category : #accessing }
CMBushmeatAnthelope >> sizeOfPOV [
	" Answer a <Number> to visually distinguish the receiver in a space "

	^ self stage sizeOfPOV
]

{ #category : #accessing }
CMBushmeatAnthelope >> stage [

	^ stage
]

{ #category : #accessing }
CMBushmeatAnthelope >> stage: aCMBushmeatStage [

	stage := aCMBushmeatStage
]

{ #category : #control }
CMBushmeatAnthelope >> step [

	self
		age: self age + 1;
		updateStage;
		updateLivingStatus;
		updateBehavior
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateBehavior [

	(self isDead not and: [ self isAdult and: [ self hasPartner not ] ])
		ifTrue: [ self move ]
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateLivingStatus [
	" Update the receiver's dead or alive status using a random probability according to its stage "
	
	self stage updateLivingStatus
	
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateStage [
	" Update the receiver's stage "
	
	self stage: (CMBushmeatStage updateStageFrom: self)
]
