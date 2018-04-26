initialize-release
initialize
	
	super initialize.
	self lineWidth onChangeSend: #setLineWidth to: self.
	self startAnnotation onChangeSend: #setStartAnnotation to: self.
	self stopAnnotation onChangeSend: #setStopAnnotation to: self.
	self startPosition onChangeSend: #startPositionChanged to: self.
	self stopPosition onChangeSend: #stopPositionChanged to: self