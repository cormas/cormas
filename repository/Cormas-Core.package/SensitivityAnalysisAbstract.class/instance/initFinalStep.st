initialize-release
initFinalStep
	
	self cormas ifNil: [^self finalStep value: 0].
	self finalStep value = self cormas cycle value
		ifFalse:
			[self cormas cycle value > 0
				ifTrue: [self finalStep value: self cormas cycle value]]