refreshing
timeChanged: aNewTimeStep
	
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX
		maxValue: aNewTimeStep;
		numberOfLabels: ((aNewTimeStep max: 1) min: 10);
		numberOfTicks: ((aNewTimeStep max: 1) min: 10).
	axisConfigurationY
		numberOfTicks: 4;
		numberOfLabels: 4.
	self renderIn: self view.
	self view signalUpdate