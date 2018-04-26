changed
colorChanged
	
	| color w |
	color := super colorChanged.
	w := (self builder componentAt: #imageOS) widget.
	w bounds asFiller displayOn: (w graphicsContext paint: color)