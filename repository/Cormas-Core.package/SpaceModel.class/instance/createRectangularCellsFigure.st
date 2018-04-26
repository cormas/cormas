private - regular cells - instance creation
createRectangularCellsFigure
	"creation des coordonnees de l'ensemble des cellules carrees de la grille"
	
	| cote carre aPov i |
	self elementaryEntitiesDefaultPovs: nil.
	self setAbsoluteBounds.
	cote := self absoluteBounds height / self line.	"cote := self absoluteBounds width / self column.  c'est pareil"
	carre := Rectangle
		origin: (cote * -1) @ 0
		corner: 0 @ cote.
	i := 1.
	self line
		timesRepeat:
			[self column
				timesRepeat:
					[carre := carre translateBy: carre width @ 0.
					aPov := VectorialElementaryPOV new: carre asPolyline.
					aPov name: #nil.
					aPov
						entityReference:
							(EntityReference on: (self elementaryEntities at: i)).
					self elementaryEntitiesDefaultPovs add: aPov.
					i := i + 1].
			carre := carre
				translateBy: (self column negated * carre width) @ carre height]