initialize-release
initialize
	
	super initialize.
	tailleHolder := 1 asValue.
	tailleHolder onChangeSend: #sizeSliderChanged to: self.
	tailleSlider := RangeAdaptor on: tailleHolder start: 0.1 stop: 1 grid: 0.1.
	self occupantPosition onChangeSend: #positionChanged to: self