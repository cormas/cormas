changed
updateSlidersFromColor: aCol
	
	aCol ifNil: [^nil].
	self blueSlider value: aCol blue.
	self greenSlider value: aCol green.
	self redSlider value: aCol red.
	self brightnessSlider value: aCol brightness