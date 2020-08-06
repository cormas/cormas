Class {
	#name : #CMFishmanMooreRandomGenerator,
	#superclass : #Object,
	#instVars : [
		'seed'
	],
	#category : #'Cormas-Core-Interface'
}

{ #category : #initialization }
CMFishmanMooreRandomGenerator >> initialize [
	super initialize.
	seed := Time millisecondClockValue
]

{ #category : #accessing }
CMFishmanMooreRandomGenerator >> next [
	^ (seed := seed * 1343714438 \\ 2147483647) / 2147483647.0
]

{ #category : #accessing }
CMFishmanMooreRandomGenerator >> nextInt: anInteger [
	^ (self next * anInteger) truncated + 1
]

{ #category : #accessing }
CMFishmanMooreRandomGenerator >> seed [
	^ seed
]

{ #category : #accessing }
CMFishmanMooreRandomGenerator >> seed: anInteger [
	seed := anInteger asInteger
]
