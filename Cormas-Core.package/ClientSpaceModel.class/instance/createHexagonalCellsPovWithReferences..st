private - regular cells - instance creation
createHexagonalCellsPovWithReferences: entitiesRef
	"On enleve le nombre de poly a hauteur et largeur afin de laisser une 
	bordure"
	"calcul du diametre du cercle"
	
	| hexagone translation hexagoneInfo delay lineCounter aPov i |
	hexagoneInfo := self createTopLeftHexagonalCellsFigure.	"SpatialEntityCoordinates new: (hexagoneInfo at: 'object') =>pour inspecter la tete que √ßa a"
	hexagone := hexagoneInfo at: 'object'.
	translation := hexagoneInfo at: 'translation'.
	delay := hexagoneInfo at: 'delay'.
	lineCounter := 1.
	i := 1.
	self line
		timesRepeat:
			[lineCounter odd
				ifTrue: [hexagone := hexagone translatedBy: delay @ 0]
				ifFalse: [hexagone := hexagone translatedBy: delay negated @ 0].
			lineCounter := lineCounter + 1.
			self column
				timesRepeat:
					[aPov := VectorialElementaryPOV new: hexagone asPolyline.
					aPov name: #nil.
					aPov entityReference: (entitiesRef at: i).
					self elementaryEntitiesDefaultPovs add: aPov.
					hexagone := hexagone translatedBy: translation x @ 0	"SpatialEntityCoordinates new: (hexagone) =>pour inspecter la tete que √ßa a"].
			hexagone := hexagone
				translatedBy: (self column * translation x negated) @ translation y].
	Dev todo:
			'c''est ici qu''il faut corriger le bug de decalage des cellules en bas √† droite sous vw7.9'