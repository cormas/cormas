changed
listEntitesSpatialesChanged
	
	| menu |
	menu := self builder menuAt: #spatialEntityMenu.
	self listSpatialEntities selection isNil
		ifTrue: [menu menuItems do: [:i | i disable]]
		ifFalse:
			[menu menuItems do: [:i | i enable].
			(self cormasModelClass cellClass notNil
				and:
					[self cormasModelClass cellClass name
						= self listSpatialEntities selection asSymbol])
				ifTrue: [(menu atNameKey: #specializeSpatialEntity) disable]]