private - regular polygons
createAggregate: compoundEntity from: aSet
	"Creates and returns an instance of compoundEntity composed with a set of cells. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := self newEntity: compoundEntity.
	anAggregate addSilentlyComponents: aSet asOrderedCollection.
	self spatialEntities
		at: compoundEntity name
		ifAbsentPut: [OrderedCollection new].
	(self spatialEntities at: compoundEntity name) add: anAggregate.
	anAggregate init.
	^anAggregate