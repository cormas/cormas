Class {
	#name : #CMReHabLoneRider,
	#superclass : #CMReHabStrategyFamily,
	#category : #'Cormas-Model-ReHab'
}

{ #category : #accessing }
CMReHabLoneRider >> possibleLocations [
	| minBiomass |
	minBiomass := Cormas
		minOf: #biomass
		amongObjects: (super possibleLocations select: [ :z | z biomass isZero not ]).
	^ super possibleLocations select: [ :z | z biomass = minBiomass ]
]
