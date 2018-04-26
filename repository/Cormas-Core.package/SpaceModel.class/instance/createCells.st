private - regular cells - instance creation
createCells
	"create all the cells and their connexions, and collect them as elementaryEntities collection"
	
	| allEse |
	allEse := Array new: cardinal withAll: nil.
	self cormasModelClass cellClass CurrentId: 0.
	1
		to: cardinal
		do:
			[:i | 
			allEse
				at: i
				put: (self newEntity: self cormasModelClass cellClass)].	"and collect them"
	self elementaryEntities: allEse.
	"self gridCellShape = #squared ifTrue: [self createRectangularCellsFigure].
	self gridCellShape = #hexagonal ifTrue: [self createHexagonalCellsFigure]."
	self initNeighbourhood.
	self boundaries = #torroidal ifFalse: [self initEdge].	"newCells notification also dispatch the request to remoteSpaceModels to rebuild the cell figures"
	"self sendCellsToClientSpaceModels: (EntityReference onEntities: allEse)."	"dispatch the info that cells have been modified to all opened spaceInterfaces"
	self changed: #newCells