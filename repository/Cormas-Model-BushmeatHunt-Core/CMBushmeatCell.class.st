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

{ #category : #accessing }
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
					self traps do: [ : trap | stream << trap asString ].
				stream
					cr; << '---' ] ]
]

{ #category : #accessing }
CMBushmeatCell >> hasTrap [
	" Answer <true> if the receiver contains at least one trap "

	^ self traps notEmpty
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
