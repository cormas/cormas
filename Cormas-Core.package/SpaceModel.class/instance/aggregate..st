- deprecated
aggregate: listPolygons
	"fusion-agregation des autres polygones sur le premier de la liste"
	
	| fusion allPolygons theOthers |
	self halt.	"should not implement anymore"
	listPolygons isEmpty
		ifFalse:
			["Attention a l'ordenancement de listPolygons !!!"
			theOthers := listPolygons
				copyFrom: 2
				to: listPolygons size.
			fusion := listPolygons first.	"Calcul des nouvelles coordonnees d'origine"
			fusion outline: (self outlineAggregatedFrom: listPolygons).	"Mise a jour des coordonnes de l'image du polygone dans la fenetre de dessin"
			self setImagesPolygons: (Array with: fusion).	"On doit supprimer les polygones senses ne plus exister avant de s'attaquer au voisinage"
			allPolygons := self cormasModel
				perform:
					('the' , listPolygons first class name asString , 's') asSymbol.
			allPolygons removeAll: theOthers.	"Reconstruction du voisinage du nouveau polygone"
			fusion neighbourhood: nil.
			self voisinsPolygonesNoeuds: (Array with: fusion).	"Reconstruction du voisinage des voisins du nouveau polygone"
			fusion neighbourhood do: [:p | p neighbourhood: nil].
			self voisinsPolygonesNoeuds: fusion neighbourhood asOrderedCollection.	"Mise a jour des components de la nouvelle entite spatiale, au cas ou elle serait composee"
			(fusion class inheritsFrom: SpatialEntityElement)
				ifFalse: [theOthers do: [:p | fusion addComponents: p components]]]