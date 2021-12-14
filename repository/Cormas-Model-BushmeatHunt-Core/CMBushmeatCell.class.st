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
	" The receiver could contain multiple traps. Add aCMTrap to the receiver's traps "
	
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

{ #category : #converting }
CMBushmeatCell >> asString [ 
	" Private - See superimplementor's comment "

	^ String streamContents: [ : stream |
		stream 
			<< 'Traps: ';
			<< self trapsCount asString.
		self traps 
			ifEmpty: [ 
				stream 
					cr; << '---'; cr;
					<< 'Location: '; cr;
					<< self coordinates asString ]
			ifNotEmpty: [ 
				stream
					cr; << '---'; cr.
					self traps do: [ : aTrap | stream << aTrap asString ].
				stream
					cr; << '---' ] ]
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

	^ self hasTrap
		  ifTrue: [ self traps anyOne color ]
		  ifFalse: [ Color fromHexString: '247008' ]
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

	self flag: #toReview.
	^ trap ifNil: [ trap := { true. false } atRandom ] ifNotNil: [ trap ]
]

{ #category : #accessing }
CMBushmeatCell >> trap: arg1 [

	self flag: #toReview.
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
