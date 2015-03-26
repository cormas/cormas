private - regular cells - instance creation
createTopLeftHexagonalCellsFigure
	"return a Dictionary ('translation'->47.619@41.2393 'delay'->23.8095 'object'->a Polyline ) where a Polyline is a perfect hexagon"
	"soit r le rayon du cercle passant par tous les sommets de l'hexagone, alors, la hauteur de l'hexagone 
	est de 2r, et la largeur de 2r cos 30¬∞ ( note: cos 30¬∞ = (3 sqrt)/2 = 0.866025 ), et un c√¥t√© mesure r. 
	- Pour rentre n hexagones sur une ligne (n=self column), il nous faut une longueur (absoluteLength) de (n+ 1/2)*largeur d'hexagone.
cad : absoluteLength = (n+ 0.5) * 2r cos 30¬∞ = (column + 0.5) * 2r cos 30¬∞
	- Pour rentrer p hexagones sur une colonne (p=self line), il nous faut une hauteur (absoluteLength) de (3.p+ 1)*largeur d'hexagone/4.
cad : absoluteLength = (3.p + 1)*(2r) / 4
	On conna√Æt la largeur et la hauteur de la fen√™tre. On calcule le 
	 - rLine = le 	rayon de l'hexagone n√©c√©ssaire pour rentrer n hexagones sur une ligne, et 
	- rColumn = le rayon de l'hexagone n√©c√©ssaire pour rentrer p hexagones sur une colonne. "
	
	| rLine rColumn thePoints hexagone hexagoneInfo rMax |
	"absoluteLength = (n+ 0.5) * 2rLine cos 30¬∞ => rLine =  absoluteLength / ((n+0.5).2 cos30) = absoluteLength / ((n+0.5). V3)"
	rLine := self absoluteWidth / ((self column + 0.5) * 3 sqrt).	"absoluteLength = (3.p + 1)*(2r) / 4 => rColumn = 2*absoluteLength /(3.p+1)"
	rColumn := 2 * (self absoluteHeight / (self line * 3 + 1)).
	hexagone := HexagonPOV polylineFromHeight: rLine length: rColumn.
	rMax := (rLine * 30 degreesToRadians cos) rounded.	"la largeur de l'hexagon = 2r cos 30¬∞"
	hexagone := hexagone translatedBy: rMax @ rColumn.	"on d√©place l'h√©xagone de la moitier de sa largeur et de sa heuteur"
	hexagoneInfo := Dictionary new.
	hexagoneInfo at: 'object' put: hexagone.
	thePoints := hexagone vertices.
	hexagoneInfo
		at: 'translation'
		put:
			((thePoints at: 6) x - (thePoints at: 2) x)
				@ ((thePoints at: 1) y - (thePoints at: 3) y).
	hexagoneInfo
		at: 'delay'
		put: (thePoints at: 1) x - (thePoints at: 2) x.
	^hexagoneInfo