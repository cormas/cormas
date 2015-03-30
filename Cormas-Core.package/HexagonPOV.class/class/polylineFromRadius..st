polyline
polylineFromRadius: radius
	"Return a regular hexagonal Polyline.
test:  HexagonFigure polylineFromRadius: 30   "
	"soit radius le rayon du cercle passant par tous les sommets de l'hexagone, alors, la hauteur de l'hexagone est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. "
	
	^self polylineFromRadius: radius angleBetweenPoints: 60