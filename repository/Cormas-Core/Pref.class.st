Class {
	#name : #Pref,
	#superclass : #Object,
	#instVars : [
		'agent',
		'pref'
	],
	#category : 'Cormas-Core-Observer'
}

{ #category : #initialize }
Pref class >> on: anAgentObs [
	
	| tmp |
	tmp := super new initialize.
	tmp privateAgent: anAgentObs.
	^tmp
]

{ #category : #acces }
Pref >> agent [
	
	^agent
]

{ #category : #initialize }
Pref >> initialize [
	
	pref := 0.
	^self
]

{ #category : #acces }
Pref >> pref [
	
	^pref
]

{ #category : #acces }
Pref >> pref: v [
	
	pref := v
]

{ #category : #private }
Pref >> privateAgent: anAgentObs [
	
	agent := anAgentObs
]
