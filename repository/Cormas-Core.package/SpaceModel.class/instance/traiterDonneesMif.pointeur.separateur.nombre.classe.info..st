private - irregular polygons creation
traiterDonneesMif: valeur pointeur: pointeur separateur: separator nombre: nb classe: aClass info: aBoolean
	"Read the coordinates of the shapes from the stream (pointeur). The instances of 'aClass' are created here and their shape is stored into the 'outline' attribut.
nb is for the number of regions for each entity (usualy 1, more if there are included entities)
ex: valeur = 'Region 1' pointeur = an ExternalReadStream on 'd:\vw7nc\cormas\Mod...   "
	
	| aggreSpat taille donnee listeCoordonnees coordonnees nombreSousRegions coorSousComposants compteur origin corner agSpat2 col |
	aggreSpat := aClass new: self.
	aggreSpat outline: OrderedCollection new.
	compteur := 1.
	nombreSousRegions := 1.
	[nombreSousRegions <= nb]
		whileTrue:
			[taille := (pointeur upTo: separator) asNumber.	" = number of points"
			coorSousComposants := OrderedCollection new.
			compteur := 1.
			origin := 99e30 @ 99e30.	"needed to calculate the bounds of the entity"
			corner := -99e30 @ -99e30.
			[compteur <= taille]
				whileTrue:
					[donnee := pointeur upTo: separator.
					listeCoordonnees := self traiterChaineDeCaractere: donnee.
					coordonnees := (listeCoordonnees at: 1) asNumber
						@ (listeCoordonnees at: 2) asNumber.
					(coordonnees x = 0 and: [coordonnees y = 0])
						ifFalse:
							[nombreSousRegions > 1
								ifTrue: [coorSousComposants add: coordonnees]
								ifFalse:
									[aggreSpat outline add: coordonnees.
									origin := origin min: coordonnees.
									corner := corner max: coordonnees].
							compteur := compteur + 1]].
			coorSousComposants isEmpty
				ifFalse: [aggreSpat includedEntities add: coorSousComposants].
			nombreSousRegions := nombreSousRegions + 1].
	aBoolean
		ifTrue:
			[self traiterAutresDonneesMif: aggreSpat pointeur: pointeur separateur:
					separator polygone: 'Region'].
	aggreSpat bounds: (Rectangle origin: origin corner: corner).	"Set the bounds of the entity"
	(self spatialEntities at: aClass name) add: aggreSpat.
	col := OrderedCollection new.
	aggreSpat includedEntities
		do:
			[:aCollOfPoints | 
			agSpat2 := aClass new: self.
			agSpat2 outline: aCollOfPoints.
			agSpat2 bounds: (Rectangle origin: origin corner: corner).
			(self spatialEntities at: aClass name) add: agSpat2.
			col add: agSpat2].	"at this time, includedEntities is a Set of collections of points"
	aggreSpat includedEntities: col	"at this time, includedEntities is a Set entities"