interface opening
updateTargetFileVM
	
	self targetFileVM value: self computeDefaultTargetFile asString.
	self userHasChoosedTargetFile: false