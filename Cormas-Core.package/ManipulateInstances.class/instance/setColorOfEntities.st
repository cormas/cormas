actions
setColorOfEntities
	
	| color collec aFig |
	self entityClass isNil not
		ifTrue:
			[self selectedEntities isEmpty
				ifTrue: [collec := self entitiesCollection]
				ifFalse: [collec := self selectedEntities].
			color := PovSetter colorChooser.
			color ifNil: [^nil].
			collec
				do:
					[:e | 
					aFig := self linkedSpaceInterface drawing components
						detect: [:fig | fig model entity = e]
						ifNone: [nil].
					aFig ifNotNil: [aFig fillColor: color]]]