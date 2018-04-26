- environment - sensing - space
layer3FromLayer2: aSet2 andLayer1: aSet1
	"returns an collection of 2 arrays of cells: layers 3 and 2"
	
	| newLayer |
	newLayer := OrderedCollection new.
	aSet2
		do:
			[:cell | 
			newLayer
				addAll:
					(cell neighbourhood
						select:
							[:c2 | (aSet2 includes: c2) not and: [(aSet1 includes: c2) not]])].
	newLayer := Array withAll: newLayer.
	^OrderedCollection with: newLayer with: aSet2