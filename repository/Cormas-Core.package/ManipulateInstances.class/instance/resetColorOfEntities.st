actions
resetColorOfEntities
	
	| collec aFig |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			collec
				do:
					[:e | 
					aFig := self linkedSpaceInterface drawing components
						detect: [:fig | fig model entity = e]
						ifNone: [nil].
					aFig
						ifNotNil:
							[aFig model entity isSpatialEntity
								ifTrue: [aFig fillColor: (aFig model getColorForPov: aFig pov)]
								ifFalse:
									[aFig class ~= BitmapFigure
										ifTrue:
											[aFig fillColor: (aFig model entity povAt: aFig pov) color]]]]]