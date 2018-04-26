instance-creation
newWith: aSetOfSpatialEntitiesOrAnObject
	"Return a new instance of SpatialEntitySet, made of aSetOfSpatialEntitiesOrAnObject
aSetOfSpatialEntitiesOrAnObject = aSpatialEntity  or a Collection of SpatialEntities"
	
	| theSpaceModel coll |
	(aSetOfSpatialEntitiesOrAnObject class inheritsFrom: Collection)
		ifTrue: [coll := aSetOfSpatialEntitiesOrAnObject asOrderedCollection]
		ifFalse:
			[coll := OrderedCollection with: aSetOfSpatialEntitiesOrAnObject].
	theSpaceModel := coll first spaceModel.
	^theSpaceModel createOneAggregate: self from: coll