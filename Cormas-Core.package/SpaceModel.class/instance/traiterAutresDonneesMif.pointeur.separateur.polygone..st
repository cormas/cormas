private - irregular polygons creation
traiterAutresDonneesMif: objet pointeur: pointeur separateur: separator polygone: typePoly
	"c est dans cette methode qu'il faudra gerer le differentes 
	possibilites; cette methode est valable 
	dans le cas d'une region au sens MapInfo; il faudra modifier 
	nbElement en fonction de la nature du 
	polygone"
	
	| donnee listeDonnees nbElement compteurBis |
	nbElement := 3.
	compteurBis := 1.
	[compteurBis <= nbElement]
		whileTrue:
			[donnee := pointeur upTo: separator.
			listeDonnees := self traiterAutreChaineDeCaractere: donnee.
			listeDonnees isEmpty
				ifTrue: [compteurBis := compteurBis + 1]
				ifFalse:
					[((listeDonnees at: 1) sameAs: 'Pen')
						ifTrue: [compteurBis := compteurBis + 1].
					((listeDonnees at: 1) sameAs: 'Brush')
						ifTrue: [compteurBis := compteurBis + 1].
					((listeDonnees at: 1) sameAs: 'Center')
						ifTrue:
							[self
								ajouterAutresAttribut:
									(self traiterAccesParticulier: (listeDonnees at: 2))
								objet: objet
								attribut: 'center'.
							compteurBis := compteurBis + 1]]]