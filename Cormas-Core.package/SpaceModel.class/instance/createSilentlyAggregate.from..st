private - regular polygons
createSilentlyAggregate: compoundEntity from: aSet
	"Creates and returns an instance of compoundEntity composed with a set of cells. The new aggregate is not displayed.
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := self newEntity: compoundEntity.
	anAggregate addSilentlyComponents: aSet asOrderedCollection.
	anAggregate setSurround.
	self spatialEntities
		at: compoundEntity name
		ifAbsentPut: [OrderedCollection new].
	(self spatialEntities at: compoundEntity name) add: anAggregate.
	anAggregate init.
	^anAggregate