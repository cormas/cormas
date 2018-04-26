private - regular cells - instance creation
createRectangularCellsPovWithReferences: entitiesRef
	"creation des coordonnees de l'ensemble des cellules carrees de la grille"
	
	| cote carre aPov i |
	self elementaryEntitiesDefaultPovs: nil.
	cote := self absoluteBounds height / self line.
	carre := Rectangle
		origin: (cote * -1) @ 0
		corner: 0 @ cote.
	i := 1.
	self line
		timesRepeat:
			[self column
				timesRepeat:
					[carre := carre translatedBy: carre width @ 0.
					aPov := VectorialElementaryPOV new: carre asPolyline.
					aPov name: #nil.
					aPov entityReference: (entitiesRef at: i).
					self elementaryEntitiesDefaultPovs add: aPov].
			carre := carre
				translatedBy: (self column negated * carre width) @ carre height]