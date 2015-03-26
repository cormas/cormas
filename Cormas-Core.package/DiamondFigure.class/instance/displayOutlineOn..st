displaying
displayOutlineOn: aGraphicsContext
	
	aGraphicsContext lineWidth: self lineWidth.
	aGraphicsContext paint: self lineColor.
	aGraphicsContext displayPolyline: self points