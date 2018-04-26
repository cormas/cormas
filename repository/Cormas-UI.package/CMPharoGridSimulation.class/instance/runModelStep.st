model scheduling
runModelStep
	model runStep.
	situatedEntitiesViews
		do: [ :e | e translateTo: (e model patch x @ e model patch y * cellSize)].
	self elements do: #updateShape