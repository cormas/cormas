initialization
initializeWithoutVS
	"set the cellClass, spatialClasses, socialClasses and passiveClasses."

	self flag: #shouldBeRevised. 	self visualStateIsOpen: false.	"should be obsolete because visualStateIsOpen refers to visualSTateWin of Cormas which is an access to the pov setter window of cormas-vw"
	self initializeCellClass.
	self initializeModelClasses