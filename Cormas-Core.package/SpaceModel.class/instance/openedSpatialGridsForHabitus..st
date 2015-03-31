private - display
openedSpatialGridsForHabitus: aStringOrNil
	"Purpose: return a collection of opened spatial grids corresponding to a habitus named aStringOrNil.
	nil is used to collect all spatial grids
	hack because of opentalk and distributed : looking for SpatialGrid in the dependents is wrong because :
	- some spatialGrids are remote
      - in this case, the registered object is a ClientSpaceModel and not a SpaceInterface
	- Opentalk register a LocalDependent in order to optimize communication
      the actual hack is simple : send a normal update to dependents with #openedSpatialGrid, asking them to register iteself in the result collection.
	Since simple collection have a #value passMode, force a #reference passMode for this result.
	"
	
	| result |
	result := OrderedCollection new asPassedByReference.
	self myDependents
		update: #openedSpatialGridsForHabitus:
		with: aStringOrNil -> result
		from: self.
	^result