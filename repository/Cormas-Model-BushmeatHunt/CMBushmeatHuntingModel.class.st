Class {
	#name : #CMBushmeatHuntingModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'anthelopes',
		'cells',
		'huntingFamilies',
		'maximumNumberOffspring'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes [
	^ anthelopes
		ifNil: [ anthelopes := OrderedCollection new ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> anthelopes: anAString [
	anthelopes := anAString
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells [

	^ cells
		  ifNil: [ cells := OrderedCollection new ]
		  ifNotNil: [ cells ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> cells: anAString [
	cells := anAString
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies [

	^ huntingFamilies
		  ifNil: [ huntingFamilies := OrderedCollection new ]
		  ifNotNil: [ huntingFamilies ]	
]

{ #category : #accessing }
CMBushmeatHuntingModel >> huntingFamilies: anAString [
	huntingFamilies := anAString
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith1000Anthelopes [

	self initSpace.
	self 
		createN: 1000 
		randomlyLocatedEntitiesFrom: { CMBushmeatFemaleAnthelope . CMBushmeatMaleAnthelope }.
]

{ #category : #init }
CMBushmeatHuntingModel >> initScenarioWith100Anthelopes [

	self initSpace.
	self anthelopes: (self 
		createN: 100
		randomlyLocatedEntitiesFrom: { CMBushmeatFemaleAnthelope . CMBushmeatMaleAnthelope });
		displayPov: #povStage of: CMBushmeatAnthelope;
		displayPov: #povPartner of: CMBushmeatMaleAnthelope
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
	^ maximumNumberOffspring
		ifNil: [ ^ maximumNumberOffspring := 10 ]
]

{ #category : #accessing }
CMBushmeatHuntingModel >> maximumNumberOffspring: anAString [
	maximumNumberOffspring := anAString
]

{ #category : #init }
CMBushmeatHuntingModel >> noAgent [

	self initSpace
]

{ #category : #'initialize-release' }
CMBushmeatHuntingModel >> step [

	self
		stepEntities: self theVegetationUnits;
		askRandom: CMBushmeatAnthelope 
		toDo: #step
]

{ #category : #control }
CMBushmeatHuntingModel >> step: aTime [

	self anthelopes do: #growth
]
