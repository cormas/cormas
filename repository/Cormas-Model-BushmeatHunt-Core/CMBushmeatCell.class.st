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

	^ String streamContents: [ :arg1 | 
		  arg1
			  << 'Traps: ';
			  << self trapsCount asString ]
]

{ #category : #accessing }
CMBushmeatCell >> hasTrap [

	^ traps notNil and: [ traps notEmpty ]
]

{ #category : #accessing }
CMBushmeatCell >> increaseTrapCatches [
	" For now we increase the trap count of all traps in the receiver "

	self traps do: #increaseCatch
]

{ #category : #pov }
CMBushmeatCell >> pov [

	^ Color fromHexString: '247008'
]

{ #category : #pov }
CMBushmeatCell >> povTrap [

	self halt.
	^ self hasTrap
		  ifTrue: [ Color black ]
		  ifFalse: [ Color green ]
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
CMBushmeatCell >> removeTrap: aCMTrap [
	" The receiver could contain multiple traps. Remove aCMTrap from the receiver's traps "
	
	self traps remove: aCMTrap
]

{ #category : #accessing }
CMBushmeatCell >> sizeOfPOV [

	^ 25
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
