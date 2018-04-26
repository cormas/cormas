labeling-image
realLabelImage
	"Answer the image (if any) to appear on the menu item (can be any 
	VisualComponent, or something that evaluates to one). Answer nil if 
	there isn't an image."
	
	adornment == nil
		ifTrue: [^nil]
		ifFalse: [^adornment labelImage]