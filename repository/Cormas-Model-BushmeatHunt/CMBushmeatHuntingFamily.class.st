Class {
	#name : #CMBushmeatHuntingFamily,
	#superclass : #CMGroup,
	#instVars : [
		'families',
		'maximumAllowedAnthelopePerFamily',
		'maximumNumberAllowedGlobalTraps',
		'traps'
	],
	#category : #'Cormas-Model-BushmeatHunt-Hunting'
}

{ #category : #accessing }
CMBushmeatHuntingFamily >> families [
	^ families
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> families: anAString [
	families := anAString
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> id [
	^ id
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> id: anAString [
	id := anAString
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumAllowedAnthelopePerFamily [
	^ maximumAllowedAnthelopePerFamily
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumAllowedAnthelopePerFamily: anAString [
	maximumAllowedAnthelopePerFamily := anAString
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumNumberAllowedGlobalTraps [
	^ maximumNumberAllowedGlobalTraps
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> maximumNumberAllowedGlobalTraps: anAString [
	maximumNumberAllowedGlobalTraps := anAString
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps [
	^ traps
]

{ #category : #accessing }
CMBushmeatHuntingFamily >> traps: anAString [
	traps := anAString
]
