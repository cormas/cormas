initialize-release
initialize
	
	self intOrFloat onChangeSend: #rangeConstraintsChanged to: self.
	self typeOfValue onChangeSend: #typeChanged to: self.
	^super initialize