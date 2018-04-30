model scheduling
runModelStep
	|obsoleteSituatedEntities  newSituatedEntities newSituatedEntitiesViews|
	model runStep.
	obsoleteSituatedEntities  := situatedEntitiesViews select: [ :e | e model isSituated not ].
	obsoleteSituatedEntities do:[:e| e remove].
	situatedEntitiesViews removeAll: obsoleteSituatedEntities.
		"model collector entities isEmpty ifFalse: [ self halt  ]."
	newSituatedEntities := model allTheSituatedEntities select:[:a | ((situatedEntitiesViews collect: [ :e | e model  ]) includes: a) not].
	newSituatedEntitiesViews := ((RTEllipse new
				color: [ :fe | fe getColorForPov: #pov ];
				size: 20) elementsOn: newSituatedEntities).
	situatedEntitiesViews addAll: newSituatedEntitiesViews.
	self addAll: newSituatedEntitiesViews.

	situatedEntitiesViews
		do: [ :e |
			e translateTo: (e model patch x @ e model patch y * cellSize)].
	self elements do: #updateShape