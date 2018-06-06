opening-closing
openWithToolbar
	| t |
	self window: super openWithToolbar.
	self window model: self.
	axisConfigurationX noDecimal.
	t := cormasModel timeStep.
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX
		maxValue: t;
		numberOfLabels: ((t max: 1) min: 10);
		numberOfTicks: ((t max: 1) min: 10).
	axisConfigurationY
		numberOfTicks: 4;
		numberOfLabels: 4.
	self renderIn: self view.
	^ self window