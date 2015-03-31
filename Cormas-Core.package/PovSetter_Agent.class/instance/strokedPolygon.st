image
strokedPolygon
	
	self imageOS model isStroked: true.
	self updateMenuImage.
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate