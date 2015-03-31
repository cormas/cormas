interface opening
openWindowGridSize
	
	| win |
	win := MenuSpaceInterfaces new
		initGridSizeLine: self spaceModel line
		column: self spaceModel column.
	win openDialog: #windowGridSize with: self