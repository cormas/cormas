Class {
	#name : #CMBushmeatHuntingModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'anthelopes',
		'cells',
		'huntingFamilies',
		'catchesNumber'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatHuntingModel class >> maximumAllowedAnthelopePerFamily [

	^ 30
]

{ #category : #accessing }
CMBushmeatHuntingModel class >> maximumAllowedTrapsPerCell [

	^ 20
]

{ #category : #accessing }
CMBushmeatHuntingModel class >> maximumHuntingFamilies [

	^ 5
]

{ #category : #accessing }
CMBushmeatHuntingModel class >> maximumNumberAllowedGlobalTraps [

	^ 500
]

{ #category : #accessing }
CMBushmeatHuntingModel class >> maximumNumberOffspring [

	^ 10
]

{ #category : #accessing }
CMBushmeatHuntingModel >> addHuntingFamily: famId [ 

	self huntingFamilies add: (CMBushmeatHuntingFamily newWithId: famId forSpace: self spaceModel)
]

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes [

	^ anthelopes
		  ifNil: [ anthelopes := OrderedCollection new ]
		  ifNotNil: [ anthelopes ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes: arg1 [

	anthelopes := arg1
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells [

	^ cells ifNil: [ cells := OrderedCollection new ] ifNotNil: [ cells ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells: arg1 [

	cells := arg1
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies [

	^ huntingFamilies
		  ifNil: [ huntingFamilies := OrderedCollection new ]
		  ifNotNil: [ huntingFamilies ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies: arg1 [

	huntingFamilies := arg1
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initAnthelopes: anthNumber [

	self anthelopes: (self createN: anthNumber randomlyLocatedEntitiesFrom: CMBushmeatAnthelope subclasses)
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initFamilies [

	1 
		to: self class maximumHuntingFamilies 
		do: [ : famId | self addHuntingFamily: famId ]
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWholeSeason [

	catchesNumber := 0.
	self
		initSpace;
		initAnthelopes: 15.
	self 
		displayPov: #pov of: CMBushmeatCell;
		displayPov: #pov of: CMBushmeatMaleAnthelope;
		displayPov: #pov of: CMBushmeatFemaleAnthelope
	
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith1000Anthelopes [

	self
		initSpace;
		initAnthelopes: 1000
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith100Anthelopes [

	self
		initSpace;
		initAnthelopes: 100;
		displayPov: #pov of: CMBushmeatMaleAnthelope;
		displayPov: #pov of: CMBushmeatFemaleAnthelope
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith15Anthelopes [

	self
		initSpace;
		initAnthelopes: 15;
		displayPov: #pov of: CMBushmeatMaleAnthelope;
		displayPov: #pov of: CMBushmeatFemaleAnthelope;
		displayPov: #pov of: CMBushmeatCell
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initSpace [

	self
		createGridLines: 30
		columns: 30
		neighbourhood: 8
		closed: true
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> initTraps [
	
	self traps do: [ : trap |
		(self pickCellAt: trap location) addTrap: trap ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> maximumNumberOffspring [

	^ self class maximumNumberOffspring
]

{ #category : #init }
CMBushmeatHuntingModel >> noAgent [

	self initSpace
]

{ #category : #control }
CMBushmeatHuntingModel >> step [

	(self timeStep \\ 26) isZero
		ifTrue: [ 
			self
			initFamilies;
			initTraps ]
		ifFalse: [ self stepEntities: CMBushmeatAnthelope ]
]

{ #category : #control }
CMBushmeatHuntingModel >> stepAnthelopes [

	self stepEntities: CMBushmeatAnthelope
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> traps [
	" Answer a <Collection> of <CMTrap> "

	^ self huntingFamilies gather: #traps
]
