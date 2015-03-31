- environment - sensing - space
distanceCell: aSpatialEntityElement
	"returns a distance in cells, between the sender and aSpatialEntityElement. 
Used for irregular cells, the calculus is much more longer
Be carefull : it's SLOW !! You should rather use 'distanceTo: aSpatialEntity ' "
	
	| n |
	n := 0.
	[(self layerOfRadius: n) includes: aSpatialEntityElement]
		whileFalse: [n := n + 1].
	^n