initialize-release
initializeSlidersFrom: start to: stop
	
	toSlider
		rangeStart: start;
		rangeStop: stop.
	fromSlider
		rangeStart: start;
		rangeStop: stop.
	self toStep value: stop.
	self fromStep value: start