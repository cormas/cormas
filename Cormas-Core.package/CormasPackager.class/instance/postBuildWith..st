interface opening
postBuildWith: aBuilder
	"we add dynamically the widgets for the checks"
	
	super postBuildWith: aBuilder.
	self addCheckWidgetsIn: aBuilder.
	self inactivateTargetFilePath