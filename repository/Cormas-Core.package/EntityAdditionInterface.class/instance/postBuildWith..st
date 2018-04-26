interface opening
postBuildWith: aBuilder
	
	('*Spatial*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel cellClass isNil
				ifFalse:
					[self spatialEntitySuperclass value: #CMSpatialEntityAggregate.
					(aBuilder componentAt: #CMSpatialEntityCell) disable.
					(aBuilder componentAt: #simpleCell) disable.
					(aBuilder componentAt: #cellAutomaton) disable.
					(aBuilder componentAt: #LabelSpecialize) enable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) enable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) enable]
				ifTrue:
					[self spatialEntitySuperclass value: #CMSpatialEntityCell.
					self cellOrCA value: #CMSpatialEntityElement.
					(aBuilder componentAt: #CMSpatialEntityCell) enable.
					(aBuilder componentAt: #simpleCell) enable.
					(aBuilder componentAt: #cellAutomaton) enable.
					(aBuilder componentAt: #LabelSpecialize) disable.
					(aBuilder componentAt: #CMSpatialEntityAggregate) disable.
					(aBuilder componentAt: #CMSpatialEntityNotConnex) disable]].
	('*Passive*' match: aBuilder window label)
		ifTrue:
			[self cormas currentModel commClasses isEmpty
				ifFalse: [(aBuilder componentAt: #Msg) enable]
				ifTrue: [(aBuilder componentAt: #Msg) disable]]