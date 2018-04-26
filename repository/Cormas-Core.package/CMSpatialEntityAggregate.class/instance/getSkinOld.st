- deprecated
getSkinOld
	"clp mars 2000"
	"renvoie les cellules en lisiere interne"
	
	^self components
		select:
			[:c | 
			(c neighbourhood select: [:n | self components includes: n]) size
				< c orderedNeighbourhood size]