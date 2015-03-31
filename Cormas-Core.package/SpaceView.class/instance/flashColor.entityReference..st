adding-removing
flashColor: aColorValue entityReference: anEntityReference
	"update the spatial figure color to be aColorValue "
	
	| aFig |
	aFig := self findRegisteredFigureFor: anEntityReference.
	aFig fillColor: aColorValue