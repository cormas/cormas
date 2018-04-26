changing
deletionUpdateFrom: aFigure
	"Since we're probably connected to the figure that was deleted, remove ourself"
	
	| anElementActivity |
	anElementActivity := aFigure model to.
	self model disconnectFromDestination: anElementActivity.
	super deletionUpdateFrom: aFigure