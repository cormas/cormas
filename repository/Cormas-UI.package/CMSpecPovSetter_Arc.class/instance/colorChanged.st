changed
colorChanged
	
	| color |
	color := super colorChanged.
	self imageOS model lineColor: color.
	imageOS figure lineColor: color.
	imageOS invalidate