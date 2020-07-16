Class {
	#name : #Maximizer,
	#superclass : #'Strategy_Family',
	#category : #'Cormas-Model-ReHab'
}

{ #category : #testing }
Maximizer class >> isAbstract [
^false
]

{ #category : #accessing }
Maximizer >> possibleLocations [
| maxBiomass |

	maxBiomass := Cormas
		maxOf: #biomass
		amongObjects: super possibleLocations.

	^super possibleLocations select: [:z | z biomass = maxBiomass]
]
