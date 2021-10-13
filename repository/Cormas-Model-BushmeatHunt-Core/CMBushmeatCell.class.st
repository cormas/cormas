Class {
	#name : #CMBushmeatCell,
	#superclass : #CMSpatialEntityCell,
	#instVars : [
		'area',
		'trap',
		'traps'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatCell class >> asGetterForEntityClass [

	^ #cells
]

{ #category : #accessing }
CMBushmeatCell >> addTrap: aCMTrap [

	self traps add: aCMTrap
]

{ #category : #accessing }
CMBushmeatCell >> area [

	^ area
]

{ #category : #accessing }
CMBushmeatCell >> area: arg1 [

	area := arg1
]

{ #category : #accessing }
CMBushmeatCell >> asString [ 
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< 'Traps: ';
			<< self trapsCount asString ]
]

{ #category : #accessing }
CMBushmeatCell >> hasTrap [
	" Answer <true> if the receiver contains at least one trap "

	^ traps notNil and: [ traps notEmpty ]
]

{ #category : #pov }
CMBushmeatCell >> pov [

	^ Color green
]

{ #category : #pov }
CMBushmeatCell >> povTrap [

	^ self hasTrap
		  ifTrue: [ Color black ]
		  ifFalse: [ Color green ]
]

{ #category : #pov }
CMBushmeatCell >> povTraps [

	^ self
		  povAttribute: #traps
		  min: 0
		  max: CMBushmeatHuntingModel maximumAllowedTrapsPerCell
		  color: Color black
]

{ #category : #accessing }
CMBushmeatCell >> trap [

	^ trap ifNil: [ trap := { true. false } atRandom ] ifNotNil: [ trap ]
]

{ #category : #accessing }
CMBushmeatCell >> trap: arg1 [

	trap := arg1
]

{ #category : #accessing }
CMBushmeatCell >> traps [

	^ traps ifNil: [ traps := OrderedCollection new ] ifNotNil: [ traps ]
]

{ #category : #accessing }
CMBushmeatCell >> traps: arg1 [

	traps := arg1
]

{ #category : #accessing }
CMBushmeatCell >> trapsCount [

	^ self traps size
]
