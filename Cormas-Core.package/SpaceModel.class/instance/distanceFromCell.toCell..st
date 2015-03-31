landscape indices
distanceFromCell: cell1 toCell: cell2
	"return the distance in number of cells (also known as Manhattan distance)"
	
	| nbLines nbCols |
	nbLines := (cell1 numLine - cell2 numLine) abs.
	nbCols := (cell1 numCol - cell2 numCol) abs.
	self boundaries = #torroidal
		ifTrue:
			[nbLines > (self line - 2) ifTrue: [nbLines := nbLines - self line + 2].
			nbCols > (self column - 2) ifTrue: [nbCols := nbCols - self column + 2]].
	self nbNeighbours = #eight ifTrue: [^nbLines max: nbCols].
	self nbNeighbours = #four ifTrue: [^nbLines + nbCols].
	self nbNeighbours = #six
		ifTrue:
			[nbLines odd
				ifTrue:
					["celui des 2 qui est √† droite, s'il est sur la partie droite de sa colonne  (ligne impaire), je rajoute 1 √† dC"
					cell1 numCol > cell2 numCol
						ifTrue: [cell1 numLine odd ifTrue: [nbCols := nbCols + 1]]
						ifFalse: [cell2 numLine odd ifTrue: [nbCols := nbCols + 1]].
					^nbLines + (0 max: (2 * nbCols - nbLines - 1) / 2)]
				ifFalse: [^nbLines + (0 max: (2 * nbCols - nbLines) / 2)]].	"for irregular cells, the calculus is much more longer"
	^cell1 distanceCell: cell2	"If nbLines is odd, 
	dist = nbLines if nbCols < (nbLines + 1)/ 2    otherwise
	dist = nbLines + (2.nbCols - nbLines - 1)/ 2
If nbLines is even, 
	dist = nbLines if nbCols < nbLines/ 2           otherwise
	dist = nbLines + (2.nbCols - nbLines)/ 2
explications:  a) dL impaire
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC -3
D1 : dL = 2.dC-3  alors on ajoute 1 
D2 : dL = 2.dC-5  alors on ajoute 2 
D3 : dL = 2.dC-7  alors on ajoute 3 
...
Dt : dL = 2.dC-(1+2t)   t est l'incr√©ment.
alors: t = (2.dC -1 - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL -1) / 2 si c'est positif]
			b) dL paire :
dist = dL en g√©n√©rale, sauf qd on s'√©loigne d'une droite oblique:
D0 : dL > 2.dC - 2
D1 : dL = 2.dC-2  alors on ajoute 1 
D2 : dL = 2.dC-4  alors on ajoute 2 
D3 : dL = 2.dC-6  alors on ajoute 3 
...
Dt : dL = 2.dC-(2t)   t est l'incr√©ment.
alors: t = (2.dC - dL)/2
donc : 
dist = dL + [ 0 ou (2.dC - dL) / 2 si c'est positif] 
bon en fait √ßa ne marche pas :
il faut aussi rajouter 1 √† dC qd dL est impaire..."