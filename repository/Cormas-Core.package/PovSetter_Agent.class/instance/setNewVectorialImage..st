editor
setNewVectorialImage: aPOV
	
	(aPOV isKindOf: VectorialPOV) ifFalse: [^nil].
	aPOV
		scaledBy:
			PovSetter standardCellBounds extent
				/ (aPOV bounds extent x max: aPOV bounds extent y).
	imageOS model: aPOV.
	imageOS figure: imageOS model asFigure.
	self tailleSlider value: aPOV sizeRatio.	"on met le tailleSlider √† 100% sans alerter les listeners"
	couleur := imageOS model color.
	self updateSlidersFromColor: couleur.
	(self builder componentAt: #boutonAppliquer) enable.
	(self builder componentAt: #isDistortable) enable.
	(self builder componentAt: #CacheBitmap) beInvisible.
	(self builder componentAt: #tailleSlider) beVisible.
	imageOS invalidate