deprecated
timeChanged
	(self window ifNil: [ false ] ifNotNil: [ :w | w isDisplayed ])
		ifFalse: [ self cormasModel removeDependent: self.
			^ self cormasModel: nil ].
	self view removeAllElements.
	datasets := OrderedCollection new.
	self refresh.
	axisConfigurationX maxValue: axisConfigurationX maxValue + 1.
	axisConfigurationX numberOfLabels: ((axisConfigurationX maxValue max: 4) min: 10).
	axisConfigurationY numberOfTicks: 4.
	axisConfigurationY numberOfLabels: 4.
	self renderIn: self view.
	self view signalUpdate