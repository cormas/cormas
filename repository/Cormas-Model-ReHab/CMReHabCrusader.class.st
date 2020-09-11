Class {
	#name : #CMReHabCrusader,
	#superclass : #CMReHabStrategyParkManager,
	#category : #'Cormas-Model-ReHab'
}

{ #category : #testing }
CMReHabCrusader class >> isAbstract [
^false
]

{ #category : #control }
CMReHabCrusader >> getLocations [
| selection coll |

	selection := OrderedCollection new.

	coll := self holder zones
		asSortedCollection: [:z1 :z2 | z1 biomass > z2 biomass].

	1
		to: 3
		do: [:index | selection add: (coll at: index)].

	^selection collect: [:z | z id]
]
