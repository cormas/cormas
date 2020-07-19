Class {
	#name : #LoneRider,
	#superclass : #'Strategy_Family',
	#category : #'Cormas-Model-ReHab'
}

{ #category : #accessing }
LoneRider >> possibleLocations [
	| minBiomass |
	minBiomass := Cormas
		minOf: #biomass
		amongObjects: (super possibleLocations select: [ :z | z biomass isZero not ]).
	^ super possibleLocations select: [ :z | z biomass = minBiomass ]
]
