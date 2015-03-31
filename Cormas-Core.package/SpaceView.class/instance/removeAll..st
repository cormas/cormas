adding-removing
removeAll: aCollectionOfFigures
	
	super removeAll: aCollectionOfFigures.
	aCollectionOfFigures
		do:
			[:fig | 
			self removeEntityFigure: fig.	"clean up the entityFigure dictionary"
			fig model: nil].
	^aCollectionOfFigures