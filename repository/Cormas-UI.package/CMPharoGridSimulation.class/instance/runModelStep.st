model scheduling
runModelStep
	model runStep.
	self removeObsoleteSituatedEntities.
	self addNewSituatedEntities.
	situatedEntitiesViews do: [ :e | e translateTo: e model patch x @ e model patch y * cellSize ].
	self elements do: #updateShape