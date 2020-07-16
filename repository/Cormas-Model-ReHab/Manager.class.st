Class {
	#name : #Manager,
	#superclass : #'Strategy_ParkManager',
	#category : #'Cormas-Model-ReHab'
}

{ #category : #testing }
Manager class >> isAbstract [
^false
]

{ #category : #control }
Manager >> getLocations [
	| corners centralZone edges others |
	corners := #(1 5 16 20).
	centralZone := self getReserveCentralZoneFrom: corners.
	centralZone isNil
		ifFalse: [ ^ self getReserveAround: centralZone ].
	edges := #(2 3 4 6 10 11 15 17 18 19).
	centralZone := self getReserveCentralZoneFrom: edges.
	centralZone isNil
		ifFalse: [ ^ self getReserveAround: centralZone ].
	others := #(7 8 9 12 13 14).
	centralZone := self getReserveCentralZoneFrom: others.
	centralZone isNil
		ifFalse: [ ^ self getReserveAround: centralZone ].
	^ #(0 0 0)
]

{ #category : #misc }
Manager >> getReserveAround: aZone [
| coll goodAround |

	coll := IndexedSet new.

	coll add: aZone.

	goodAround := aZone neighbourhood
		asSortedCollection: [:z1 :z2 | z1 biomass > z2 biomass].

	coll add: goodAround first.
	coll add: (goodAround at: 2).

^coll collect: [:z | z id]
]

{ #category : #misc }
Manager >> getReserveCentralZoneFrom: aColl [
| goodLocations |

	goodLocations := self holder zones
		select:
			[:z | z biomass >= Bird habitatSuitabilityThreshold and: [aColl includes: z id]].

	goodLocations := goodLocations
		asSortedCollection:
			[:z1 :z2 |
			(z1 neighbourhoodAndSelf
				select: [:z | z biomass >= Bird habitatSuitabilityThreshold]) size
				>
					(z2 neighbourhoodAndSelf
						select: [:z | z biomass >= Bird habitatSuitabilityThreshold]) size].

	^goodLocations isEmpty ifTrue: [nil] ifFalse: [goodLocations first]
]
