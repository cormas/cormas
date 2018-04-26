accessing-Figures
entityComponents
	"return a collection of all the components that are figures of entity"
	
	^self components select: [:c | c isTrackFigure not]