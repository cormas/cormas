initialize-release
initialize: model
	
	super initialize.
	cormasModel := model.
	self menuHolder: self class menuChartsLevel asValue.
	self chartsList selectionIndexHolder onChangeSend: #updateChartsDisplay
		to: self.
	self idList selectionIndexHolder onChangeSend: #updateLocalChartsDisplay
		to: self.
	fromSlider := RangeAdaptor
		on: self fromStep
		start: 0
		stop: model class timeStep
		grid: 1.
	toSlider := RangeAdaptor
		on: self toStep
		start: 0
		stop: model class timeStep
		grid: -1