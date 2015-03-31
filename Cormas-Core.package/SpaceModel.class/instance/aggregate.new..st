- deprecated
aggregate: listPolygons new: entityC
	"Creation d'une entite de niveau N+1 par aggregation de polygones de niveau N"
	"!!! Les elements de listPolygons doivent etre adjacents !!!"
	
	| newEntityC |
	self halt.	"should not implement anymore"
	listPolygons isEmpty
		ifFalse:
			[newEntityC := entityC new init.	"Calcul des coordonnees d'origine"
			newEntityC outline: (self outlineAggregatedFrom: listPolygons).	"Mise a jour des coordonnes de l'image du polygone dans la fenetre de dessin"
			self setImagesPolygons: (Array with: newEntityC).	"Construction du voisinage du nouveau polygone"
			newEntityC neighbourhood: nil.
			self voisinsPolygonesNoeuds: (Array with: newEntityC).	"Reconstruction du voisinage des voisins du nouveau polygone"
			newEntityC neighbourhood do: [:p | p neighbourhood: nil].
			self
				voisinsPolygonesNoeuds: newEntityC neighbourhood asOrderedCollection.	"Mise a jour des components de la nouvelle entite spatiale"
			newEntityC addComponents: listPolygons.
			(self cormasModel
				perform: ('the' , entityC name asString , 's') asSymbol) add:
					newEntityC]