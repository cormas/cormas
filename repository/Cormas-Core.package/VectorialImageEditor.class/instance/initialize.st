initialize-release
initialize
	
	super initialize.
	self sliderWidth onChangeSend: #sliderWidthChanged to: self.
	self sliderHeigth onChangeSend: #sliderHeigthChanged to: self