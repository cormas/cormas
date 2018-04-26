transforming
asGeometrics
	"returns a collection of Polylines. The first one is the external Polyline."
	
	| coll |
	coll := OrderedCollection new.
	self delimitors do: [:points | coll add: (Polyline vertices: points)].
	^coll