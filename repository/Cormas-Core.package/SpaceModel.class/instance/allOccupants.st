accessing
allOccupants
	"return a list of all the located entities"

	^ self cormasModel allTheEntities select: [ :entity | entity isSituated ]