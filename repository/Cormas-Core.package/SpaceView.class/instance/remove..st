adding-removing
remove: aFigure
	
	self removeEntityFigure: aFigure.	"clean up the entityFigure dictionary"
	aFigure model: nil.
	super remove: aFigure