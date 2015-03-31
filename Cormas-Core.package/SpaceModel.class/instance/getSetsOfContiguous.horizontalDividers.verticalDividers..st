private - regular polygons
getSetsOfContiguous: baseEntity horizontalDividers: i verticalDividers: j
	
	| nbLG nbCG nbLP nbCP zone allComponents collec |
	"dimensions de la grille"
	nbLG := line.
	nbCG := column.	"dimensions d'une partition"
	nbLP := nbLG / j.
	nbCP := nbCG / i.	"calcul sous-grille de chaque cellule"
	allComponents := Dictionary new.
	1
		to: i * j
		do:
			[:n | 
			allComponents
				at: n
				put: OrderedCollection new].
	(self spatialEntities at: baseEntity name)
		do:
			[:cc | 
			line := (cc id / nbCG) ceiling.
			column := cc id - ((line - 1) * nbCG).
			zone := nbCG / nbCP * ((line / nbLP) ceiling - 1)
				+ (column / nbCP) ceiling.
			(allComponents at: zone) add: cc].
	collec := OrderedCollection new.
	1
		to: allComponents size
		do: [:n | collec add: (allComponents at: n)].
	^collec