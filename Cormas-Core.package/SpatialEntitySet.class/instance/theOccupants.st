+ accessing
theOccupants
	"redefined to collect the occupants registered in all the components"
	
	theOccupants := Dictionary new.
	self components
		do:
			[:cellOrAggregate | 
			cellOrAggregate theOccupants
				keysAndValuesDo:
					[:k :collec | 
					(theOccupants
						at: k
						ifAbsentPut: [OrderedCollection new]) addAll: collec]].
	^theOccupants