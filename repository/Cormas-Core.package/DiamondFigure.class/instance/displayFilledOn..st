displaying
displayFilledOn: aGraphicsContext
	
	aGraphicsContext paint: self fillColor.
	aGraphicsContext displayPolygon: self points	"at: self center."