Class {
	#name : #CMReHabExplorer,
	#superclass : #CMReHabStrategyFamily,
	#category : #'Cormas-Model-ReHab'
}

{ #category : #accessing }
CMReHabExplorer >> possibleLocations [
	^ super possibleLocations select: [ :z | z biomass isZero not ]
]
