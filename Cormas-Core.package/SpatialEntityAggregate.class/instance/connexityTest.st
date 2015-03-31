- obsolete
connexityTest
	"teste si les cellules de l' agreg (self) sont ttes connexes: a partir d'une cellule quelconque de l'agreg, la procedure determine un Agregat (agreg2). 
Retourne la liste des cells de l'agreg qui n'appartiennent pas a agreg2. Si cette liste est vide = ok"
	
	| agreg2 listeVoisins listTempo test agreg1 |
	test := OrderedCollection new.
	agreg1 := Set new.
	agreg1 addAll: self components.
	agreg1 do: [:c | c flag: false].
	agreg2 := Set new.
	agreg2 add: ((self at: 1) flag: true).
	listeVoisins := agreg2.
	[listeVoisins isEmpty]
		whileFalse:
			[listTempo := Set new.
			listeVoisins
				do:
					[:cell | 
					listTempo
						addAll:
							(cell neighbourhood
								select: [:v | (agreg1 includes: v) and: [v flag = false]])].
			listeVoisins := listTempo.
			listeVoisins do: [:c | c flag: true].
			agreg2 addAll: listeVoisins].
	agreg2 do: [:c | c flag: false].	"tester uniquement sur la taille ne suffit pas :"
	test := agreg1 - agreg2.
	^test