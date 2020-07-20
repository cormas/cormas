Class {
	#name : #CMReHabMaximizer,
	#superclass : #CMReHabStrategyFamily,
	#category : #'Cormas-Model-ReHab'
}

{ #category : #accessing }
CMReHabMaximizer >> possibleLocations [
| maxBiomass |

	maxBiomass := Cormas
		maxOf: #biomass
		amongObjects: super possibleLocations.

	^super possibleLocations select: [:z | z biomass = maxBiomass]
]
