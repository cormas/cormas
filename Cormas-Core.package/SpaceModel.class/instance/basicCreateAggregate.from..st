private - regular polygons
basicCreateAggregate: compoundEntity from: aSet
	"Creates and returns an instance of compoundEntity composed with a set of cells. The new aggregate is not displayed, nor added to theXXs collection and the components are not informed.
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| anAggregate |
	anAggregate := compoundEntity basicNew.
	anAggregate components addAll: aSet asOrderedCollection.
	anAggregate setSurround.
	anAggregate init.
	^anAggregate