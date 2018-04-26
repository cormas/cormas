editor
setNewBitmapImage: anImage
	
	| im |
	"on adapte le slider avant de coller l'image dans imageOS"
	"tailleHolder value: ((im preferredBounds extent x / self imageOS bounds extent x 
				max: im preferredBounds extent y / self imageOS bounds extent y) min: 2)."
	tailleHolder value: 1.
	im := anImage.	"si image trop grande, on la r√©tr√©cit"
	[im preferredBounds extent > (self imageOS bounds extent * 1.5)]
		whileTrue:
			[im := im shrunkenBy: 2 @ 2.
			tailleHolder value: tailleHolder value / 2].
	imageOS model: (BitmapPOV newFrom: im).
	imageOS figure: imageOS model asFigure.
	(self builder componentAt: #boutonAppliquer) enable.
	(self builder componentAt: #isDistortable) disable.
	(self builder componentAt: #CacheBitmap) beVisible.
	imageOS invalidate