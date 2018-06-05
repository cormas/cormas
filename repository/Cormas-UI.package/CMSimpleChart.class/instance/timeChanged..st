refreshing
timeChanged: aNewTimeStep
	(self window ifNil: [ false ] ifNotNil: [ :w | w isDisplayed ])
		ifFalse: [ ^ self cormasModel announcer unsubscribe: self ].	"this is a hack to unsubscribe to the announcer when the window is close"
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