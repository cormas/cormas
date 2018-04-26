CSE (regular) - dynamics
swell: compoundEntityClass
	"Each instance of compoundEntityClass swells on its surround layer. It swells if there is enough space arround it. The order of the compoundEntities is randomly mixed. 
	Returns a boolean indicating if at least one aggregate has spread.
	compoundEntityClass = aClass, subclass of SpatialEntitySet"
	
	| haveSpread |
	haveSpread := false.
	(Cormas mixt: (self spatialEntities at: compoundEntityClass name))
		do: [:aggregate | aggregate swell ifTrue: [haveSpread := true]].
	^haveSpread