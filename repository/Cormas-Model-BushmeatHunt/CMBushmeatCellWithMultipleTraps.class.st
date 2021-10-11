Class {
	#name : #CMBushmeatCellWithMultipleTraps,
	#superclass : #CMBushmeatCell,
	#instVars : [
		'traps'
	],
	#category : #'Cormas-Model-BushmeatHunt-Core'
}

{ #category : #accessing }
CMBushmeatCellWithMultipleTraps >> traps [
	^ traps
]

{ #category : #accessing }
CMBushmeatCellWithMultipleTraps >> traps: anAString [
	traps := anAString
]
