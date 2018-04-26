managing classes
visualizableClasses
	"Return a list of the model' classes for whom a 'pov' protocol exists"
	
	| coll |
	coll := OrderedCollection withAll: self occupantClasses.
	coll addAll: self spatialClasses.
	^coll