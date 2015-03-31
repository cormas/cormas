- obsolete
setImageFromIrregularCells
	
	| mainPolyline |
	mainPolyline := Polyline vertices: self outline.
	self image: mainPolyline.	"le centre de l'agregat correspond au centre du 1er element"	"self includedEntities addAll: thePolylines"
	self center: (self at: 1) center