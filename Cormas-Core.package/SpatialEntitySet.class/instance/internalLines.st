- accessing
internalLines
	"Returns a collection wontaining the internal contours of this spatialEntity. 
For example, a ring-like aggregate will return a collection with 1 polyline, when an 8-like aggregate will returns 2 polylines"
	
	^self defaultPOV internalLines