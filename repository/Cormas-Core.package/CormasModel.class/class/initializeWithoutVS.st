instance creation
initializeWithoutVS
	"set the cellClass, spatialClasses, socialClasses and passiveClasses.
Set the Charts"

	self visualStateIsOpen: false.
	self initializeCellClass.
	self initializeModelClasses.
	self initializeCharts.