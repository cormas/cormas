private - regular polygons
createOneAggregate: compoundEntity from: aSet
	"Creates and returns an instance of compoundEntity composed with a set of cells. 
	aSet = a set of base entities (inheriting from <SpatialEntity>) 
	compoundEntity = a Class name inheriting from <SpatialEntitySet>"
	
	| aggregate |
	aggregate := self createAggregate: compoundEntity from: aSet.	"alarm the other"
	self dispatchOneCompoundSpatialEntity: aggregate.
	^aggregate