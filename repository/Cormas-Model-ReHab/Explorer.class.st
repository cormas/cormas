Class {
	#name : #Explorer,
	#superclass : #'Strategy_Family',
	#category : #'Cormas-Model-Rehab'
}

{ #category : #accessing }
Explorer >> possibleLocations [
	^ super possibleLocations select: [ :z | z biomass isZero not ]
]
