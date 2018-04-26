private - display
openedSpatialGrids
	"Purpose: return a collection of all opened spatial grids.
	hack because of opentalk and distributed : looking for SpatialGrid in the dependents is wrong because :
	- some spatialGrids are remote
      - in this case, the registered object is a ClientSpaceModel and not a SpaceInterface
	- Opentalk register a LocalDependent in order to optimize communication
      the actual hack is simple : send a normal update to dependents with #openedSpatialGrid, asking them to register iteself in the result collection.
	Since simple collection have a #value passMode, force a #reference passMode for this result.
	
	"
	
	^self openedSpatialGridsForHabitus: nil