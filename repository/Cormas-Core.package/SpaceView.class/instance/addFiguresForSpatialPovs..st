adding-removing
addFiguresForSpatialPovs: aCollectionOfPovs
	"Add a COPY of the Figures, adapted to my bounds
	returns the figures created"
	
	| figures |
	figures := aCollectionOfPovs
		collect: [:aPov | self addFigureForSpatialPov: aPov].	"re display with the delimiter size"
	self delimiter: self delimiter.
	self delimiterColor: self delimiterColor.
	^figures