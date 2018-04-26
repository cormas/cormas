changing
scaleByWithAnswer: aPoint
	"on augmente par le min (x ou y) du point seulement si il est + grand que 2, sinon, on ne fait rien.
on a besoin d'un seul nbre entier positif : 
magnifiedBy: scale ou shrunkenBy: scale et Scale X and Y must be integers"
	
	| min |
	min := aPoint isReal
		ifTrue: [aPoint]
		ifFalse: [aPoint x min: aPoint y].
	min > 1
		ifTrue:
			[min := min rounded.
			min > 1
				ifTrue:
					[cache := cache magnifiedBy: min @ min.
					^true]]
		ifFalse:
			[min := (1 / min) rounded.
			min > 1
				ifTrue:
					[cache := cache shrunkenBy: min @ min.
					^true]].
	^false