- deprecated
distCell: aSpatialEntityElement
	"returns a distance in cells, between the sender and aSpatialEntity"
	
	^self spaceModel distanceFromCell: self toCell: aSpatialEntityElement