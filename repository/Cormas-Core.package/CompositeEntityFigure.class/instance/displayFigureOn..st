displaying
displayFigureOn: aGraphicsContext
	
	self isOpaque ifTrue: [super displayFigureOn: aGraphicsContext].	"display the delimitors"	"self model entity id = 14 ifTrue:[self halt]."
	self lineWidth > 0
		ifTrue:
			[aGraphicsContext lineWidth: self lineWidth.
			aGraphicsContext paint: self lineColor.
			self delimitors
				do: [:aPolyline | aPolyline displayStrokedOn: aGraphicsContext]].	"display the text info"
	self displayInfoOn: aGraphicsContext