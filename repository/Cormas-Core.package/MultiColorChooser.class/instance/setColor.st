initialize-release
setColor
	
	self listElements selection
		ifNil: [^Dialog warn: 'Please, select a probe'].
	self elementColorDict
		at: self listElements selection
		put: self selection