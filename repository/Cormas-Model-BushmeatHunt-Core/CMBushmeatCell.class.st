Class {
	#name : #CMBushmeatCell,
	#superclass : #CMSpatialEntityElement,
	#instVars : [
		'area',
		'traps'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #converting }
CMBushmeatCell class >> asGetterForEntityClass [

	^ #cells
]

{ #category : #accessing }
CMBushmeatCell >> addTrap: arg1 [

	self traps add: arg1
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

	^ self traps notEmpty
]

{ #category : #pov }
CMBushmeatCell >> pov [

	^ self hasTrap
		  ifTrue: [ self traps anyOne color ]
		  ifFalse: [ Color fromHexString: '247008' ]
]

{ #category : #pov }
CMBushmeatCell >> povTraps [

	self halt.
	^ self
		  povAttribute: #traps
		  min: 0
		  max: CMBushmeatHuntingModel maximumAllowedTrapsPerCell
		  color: Color black
]

{ #category : #accessing }
CMBushmeatCell >> sizeOfPOV [

	^ 25
]

{ #category : #accessing }
CMBushmeatCell >> traps [

	^ traps 
		ifNil: [ traps := OrderedCollection new ]
]

{ #category : #accessing }
CMBushmeatCell >> traps: arg1 [

	traps := arg1
]

{ #category : #accessing }
CMBushmeatCell >> trapsCount [

	^ self traps size
]
