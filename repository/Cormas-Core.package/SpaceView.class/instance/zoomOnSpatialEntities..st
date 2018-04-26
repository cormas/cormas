private - mouse actions
zoomOnSpatialEntities: aSetOfFigures
	"the user clicked and draged on a set of entities of the grid. An interfaceZoom is opened on the target entities"
	
	aSetOfFigures isEmpty ifTrue: [^nil].
	SpaceInterfaceZoom openAndDisplayFigures: aSetOfFigures