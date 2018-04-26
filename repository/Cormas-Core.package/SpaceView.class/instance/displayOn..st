displaying
displayOn: aGraphicsContext
	"overriden to set the backgroundColor"
	
	| clipRect |
	clipRect := aGraphicsContext clippingBounds.
	aGraphicsContext paint: self backgroundFillColor.
	clipRect displayFilledOn: aGraphicsContext.
	self isVisible
		ifTrue:
			[self isSelected
				ifTrue: [self displaySelectedFigureOn: aGraphicsContext]
				ifFalse: [self displayFigureOn: aGraphicsContext]].
	handles
		do:
			[:each | (each intersects: clipRect) ifTrue: [each displayOn: aGraphicsContext copy]]