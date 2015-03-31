changed
colorChanged
	
	| color |
	color := super colorChanged.
	self imageOS model color: color.
	imageOS figure fillColor: color.
	imageOS invalidate