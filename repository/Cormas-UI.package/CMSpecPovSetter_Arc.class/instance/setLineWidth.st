changed
setLineWidth
	
	self imageOS model lineWidth: self lineWidth value.
	imageOS figure lineWidth: self lineWidth value.
	imageOS invalidate.
	(self builder componentAt: #boutonAppliquer) enable