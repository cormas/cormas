interface opening
postBuildWith: aBuilder
	
	('*Spatial*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel cellClass isNil
				ifFalse:
					[self spatialEntitySuperclass value: #SpatialEntityAggregate.
					(aBuilder componentAt: #SpatialEntityCell) disable.
					(aBuilder componentAt: #simpleCell) disable.
					(aBuilder componentAt: #cellAutomaton) disable.
					(aBuilder componentAt: #LabelSpecialize) enable.
					(aBuilder componentAt: #SpatialEntityAggregate) enable.
					(aBuilder componentAt: #SpatialEntityNotConnex) enable]
				ifTrue:
					[self spatialEntitySuperclass value: #SpatialEntityCell.
					self cellOrCA value: #SpatialEntityElement.
					(aBuilder componentAt: #SpatialEntityCell) enable.
					(aBuilder componentAt: #simpleCell) enable.
					(aBuilder componentAt: #cellAutomaton) enable.
					(aBuilder componentAt: #LabelSpecialize) disable.
					(aBuilder componentAt: #SpatialEntityAggregate) disable.
					(aBuilder componentAt: #SpatialEntityNotConnex) disable]].
	('*Passive*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel commClasses isEmpty
				ifFalse: [(aBuilder componentAt: #Msg) enable]
				ifTrue: [(aBuilder componentAt: #Msg) disable]]