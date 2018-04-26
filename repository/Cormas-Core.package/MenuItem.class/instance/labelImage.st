labeling-image
labelImage
	"Answer the image (if any) to appear on the menu item (can be any VisualComponent).  Answer nil if there isn't an image."
	
	| im |
	im := self realLabelImage.
	^[im value]
		on: Object messageNotUnderstoodSignal
		from: im
		do: [:ex | ex return: im]