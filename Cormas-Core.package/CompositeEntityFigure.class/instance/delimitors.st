accessing
delimitors
	"returns a collection of collections of points, in order to build the Polylines. The first one is the external collection of points."
	
	^delimitors ifNil: [delimitors := OrderedCollection new]