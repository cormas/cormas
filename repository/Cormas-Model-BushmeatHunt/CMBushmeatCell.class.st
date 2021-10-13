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
CMBushmeatCell >> area [
	^ area
]

{ #category : #accessing }
CMBushmeatCell >> area: anAString [
	area := anAString
]

{ #category : #testing }
CMBushmeatCell >> hasTrap [ 

	^ trap
]

{ #category : #pov }
CMBushmeatCell >> pov [

	^ Color green
]

{ #category : #pov }
CMBushmeatCell >> povTrap [

	^ self hasTrap 
		ifFalse: [ Color green ] 
		ifTrue: [ Color black ]
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

	^ trap
		ifNil: [ trap := { true . false } atRandom ]
]

{ #category : #accessing }
CMBushmeatCell >> trap: anObject [

	trap := anObject
]

{ #category : #accessing }
CMBushmeatCell >> traps [
	^ traps
		ifNil: [ traps := OrderedCollection new ]
]

{ #category : #accessing }
CMBushmeatCell >> traps: anAString [
	traps := anAString
]
