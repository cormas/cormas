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

{ #category : #testing }
CMBushmeatAnthelope >> customShapeSelector [

	^ self hasPartner
		  ifTrue: [ 
			  self halt.
			  #bitmap ]
		  ifFalse: [ #ellipse ]
]

{ #category : #moving }
CMBushmeatAnthelope >> delete [

	self cormasModel removeAnthelope: self.
	super delete.

]

{ #category : #accessing }
CMBushmeatAnthelope >> detailsOfPOV [
	" Answer a <String> to visually distinguish the receiver in a space "

	^ String << [ : stream |
		stream 
			<< 'Sex: '; << self sexString; cr; 
			<< 'Stage: '; << self stage friendlyName; cr;
			<< 'Age: '; << self age asString; cr;
			<< 'Location: '; << self coordinates asString.
		self hasPartner 
			ifTrue: [ 
				stream cr; << 'Partner: ';
					<< self partner asString ] ]
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
	" Answer a <String> to visually distinguish the receiver in a space "

	^ String << [ : stream |
		stream 
			<< self sexString first;
			space; 
			<< self age asString ]
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

	| tmp1 |
	(tmp1 := self findPartner)
		ifNil: [ self moveToEmptyPlace ]
		ifNotNil: [ 
			partner := tmp1.
			self moveTo: tmp1 patch.
			partner partner: self ]
]

{ #category : #moving }
CMBushmeatAnthelope >> moveTo: nearestEmptyLoc [

	super moveTo: nearestEmptyLoc.
	nearestEmptyLoc hasTrap ifFalse: [ ^ self ].
	self cormasModel increaseCatchesNumber.
	nearestEmptyLoc increaseTrapCatches.
	self delete
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> moveToEmptyPlace [

	| tmp1 |
	(tmp1 := self nearestEmptyLocation)
		ifNil: [ ('No empty location for: ' , self id asString) traceCr ]
		ifNotNil: [ self moveTo: tmp1 ]
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

{ #category : #pov }
CMBushmeatAnthelope >> povStage [

	^ self isDead
		  ifTrue: [ Color black ]
		  ifFalse: [ 
			  self hasPartner
				  ifTrue: [ Color red ]
				  ifFalse: [ self pov ] ]
]

{ #category : #printing }
CMBushmeatAnthelope >> printOn: arg1 [

	arg1
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

	^ self stage sizeOfPOV
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
		updateStage;
		updateBehavior
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateBehavior [

	(self isAdult and: [ self hasPartner not ]) ifTrue: [ self move ]
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateLivingStatus [
	" Update the receiver's dead or alive status using a random probability according to its stage "
	
	self stage updateLivingStatus
	
]

{ #category : #'population dynamics' }
CMBushmeatAnthelope >> updateStage [

	self stage: (CMBushmeatStage updateStageFrom: self)
]
