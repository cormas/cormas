initialize-release
initialize
	
	| ctr |
	super initialize.
	ctr := ControllerWithMenu new.
	ctr menuHolder: (self menuFor: #menuImage) asValue.
	ctr performer: self.
	(self componentFor: #imageOS) controller: ctr.
	redHolder := 0 asValue.
	greenHolder := 0 asValue.
	blueHolder := 0 asValue.
	brightnessHolder := 1 asValue.
	redHolder onChangeSend: #colorChanged to: self.
	greenHolder onChangeSend: #colorChanged to: self.
	blueHolder onChangeSend: #colorChanged to: self.
	brightnessHolder onChangeSend: #colorChanged to: self.
	redSlider := RangeAdaptor on: redHolder start: 0 stop: 1 grid: 0.01.
	greenSlider := RangeAdaptor on: greenHolder start: 0 stop: 1 grid: 0.01.
	blueSlider := RangeAdaptor on: blueHolder start: 0 stop: 1 grid: 0.01.
	brightnessSlider := RangeAdaptor on: brightnessHolder start: 0 stop: 1
		grid: 0.01