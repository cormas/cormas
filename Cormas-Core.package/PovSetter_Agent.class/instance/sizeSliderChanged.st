changed
sizeSliderChanged
	
	tailleHolder value = imageOS model sizeRatio ifTrue: [^self].	"on est oblig√© de repartir de la figure de d√©part pour pas perdre la r√©solution du bitmap de d√©part
Lorsqu''on part de la figure de d√©part la position est au milieu sur la vue du povSetter. Il faut donc appeler un positionChanged ; mais on fait cela apr√®s avoir ajuster la taille au sizeRatio demand√©"
	imageOS figure: imageOS model asFigure.	"newScale = newValue / oldValue"
	(imageOS figure
		scaleByWithAnswer: tailleHolder value / imageOS model sizeRatio)
		ifFalse: [^self].	"pour les bitmap, un petit changement ne produit pas de d√©formation du bitmap, et il n efaut donc pas changer le size Ratio"
	self positionChanged.	"ici on recacul la position en fonction de la position sp√©cifi√© sur l''interface"
	imageOS model sizeRatio: tailleHolder value.
	self builder ifNil: [^self].
	(self builder componentAt: #boutonAppliquer) enable.
	imageOS invalidate