polyline
polylineFromRadius: radius angleBetweenPoints: angleInDegrees
	"Return a regular polygonal Polyline.
test:  (VectorialElementaryFigure polylineFromRadius: 30  angleBetweenPoints: 90) asFigure"
	"soit radius le rayon du cercle passant par tous les sommets du polygone, alors, la hauteur du polygone est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. "
	
	| thePoints startPoint theAngle x y |
	thePoints := OrderedCollection new.
	startPoint := 0 @ radius.
	theAngle := angleInDegrees degreesToRadians.
	0
		to: 1
		by: 1
		do:
			[:verticeCounter | 
			x := startPoint x * (theAngle * verticeCounter) cos
				- (startPoint y * (theAngle * verticeCounter) sin).
			y := startPoint x * (theAngle * verticeCounter) sin
				+ (startPoint y * (theAngle * verticeCounter) cos).
			thePoints add: x @ y].
	thePoints add: ((thePoints at: 2) copy scaledBy: 1 @ -1).
	thePoints add: ((thePoints at: 1) copy scaledBy: 1 @ -1).
	thePoints add: ((thePoints at: 3) copy scaledBy: -1 @ 1).
	thePoints add: ((thePoints at: 2) copy scaledBy: -1 @ 1).
	thePoints add: (thePoints at: 1) copy.
	^Polyline vertices: thePoints