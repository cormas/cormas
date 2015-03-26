changing
scaleBy: aPoint
	"on augmente par le min (x ou y) du point seulement si il est + grand que 2, sinon, on ne fait rien.
on a besoin d'un seul nbre entier positif : 
magnifiedBy: scale ou shrunkenBy: scale et Scale X and Y must be integers"
	"Transcript cr; show: 'scaleBy: '; print: aPoint; show: ' (oldScale: '; print: self scale; nextPut:$)."
	
	self scale: self scale * aPoint