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

	self huntingFamilies add: 
		(CMBushmeatHuntingFamily new 
			id: famId; 
			space: self spaceModel;
			yourself)
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

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioHuntingSeason [

	catchesNumber := 0.
	1 to: self class maximumHuntingFamilies do: [ : famId |
		self addHuntingFamily: famId ].

	self displayPov: #povTrap of: CMBushmeatCell
	
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith1000Anthelopes [

	self
		initSpace;
		createN: 1000 randomlyLocatedEntitiesFrom: { 
				CMBushmeatFemaleAnthelope.
				CMBushmeatMaleAnthelope }
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith100Anthelopes [

	self
		initSpace;
		anthelopes: (self createN: 100 randomlyLocatedEntitiesFrom: { 
						 CMBushmeatFemaleAnthelope.
						 CMBushmeatMaleAnthelope });
		displayPov: #pov of: CMBushmeatMaleAnthelope;
		displayPov: #pov of: CMBushmeatFemaleAnthelope
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith15Anthelopes [

	self
		initSpace;
		anthelopes: (self createN: 15 randomlyLocatedEntitiesFrom: { 
						 CMBushmeatFemaleAnthelope.
						 CMBushmeatMaleAnthelope });
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

	self stepEntities: CMBushmeatAnthelope.
]
