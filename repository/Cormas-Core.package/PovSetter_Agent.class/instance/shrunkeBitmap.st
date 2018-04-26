actions
shrunkeBitmap
	
	(imageOS figure scaleByWithAnswer: 0.5) ifFalse: [^self].	"pour les bitmap, un petit changement ne produit pas de d√©formation du bitmap, et il n efaut donc pas changer le size Ratio"
	self positionChanged.	"ici on recacul la position en fonction de la position sp√©cifi√© sur l''interface"
	imageOS model sizeRatio: 0.5.
	self builder ifNil: [^self].
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate.
	(self builder componentAt: #CacheBitmap) beVisible.
	(self builder componentAt: #tailleSlider) beInvisible