managing classes
spatialClasses_sorted
	"return a collection of SpatialClasses of the model, starting with the Cell class"
	
	| coll |
	self cellClass ifNil: [^#()].
	coll := self compoundSpatialClasses asOrderedCollection.
	coll addFirst: self cellClass.
	^coll