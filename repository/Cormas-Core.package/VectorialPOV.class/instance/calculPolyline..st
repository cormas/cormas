private
calculPolyline: nbreSegments
	"Set the outline attribut = to a Polyline"
	
	| points x y longueurArrete |
	longueurArrete := self sizeRatio * PovSetter standardCellBounds height /
			nbreSegments * 2.	"longueurArrete := 1."
	points := OrderedCollection new.
	Float pi / 2
		to: 5 / 2 * Float pi
		by: 2 * Float pi / nbreSegments
		do:
			[:angle | 
			x := 0 - (longueurArrete * angle cos).
			y := 0 - (longueurArrete * angle sin).
			points add: x @ y].
	outline := Polyline vertices: points