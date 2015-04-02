util_images
construireImageMultipleAvec: uneImage
	"construire une image illustrant la multiplicit√© √† partir d'uneImage"
	
	| delta pixmap gc |
	delta := 15 @ 10.
	pixmap := Pixmap extent: uneImage extent + delta.
	gc := pixmap graphicsContext.
	uneImage displayOn: gc.
	uneImage displayOn: gc at: delta.
	^pixmap asImage