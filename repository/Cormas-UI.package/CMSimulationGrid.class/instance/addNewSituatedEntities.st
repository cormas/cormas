model scheduling
addNewSituatedEntities
	
	| newSituatedEntities newSituatedEntitiesViews |
	newSituatedEntities := model allTheSituatedEntities select: [ :a | ((situatedEntitiesViews collect: [ :e | e model ]) includes: a) not ].
	newSituatedEntitiesViews := (RTEllipse new
		color: [ :fe | fe getColorForPov: #pov ];
		size: 20) elementsOn: newSituatedEntities.
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self addAll: newSituatedEntitiesViews.
	newSituatedEntitiesViews do: [:nse | nse @ CMDraggableSituatedEntity  ]
	