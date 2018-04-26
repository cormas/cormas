+ accessing - entities
pickCellsN: anInteger
	"Purpose: Return a collection of spatialEntityElements (some Cells) picked randomly from the spatial grid (without replacement).
Example: self pickCellsN: 5"
	
	^Cormas
		selectRandomlyFrom: self theESE
		subCollectionSize: anInteger