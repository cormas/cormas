aspects
changedInitMethod
	
	self listInit selection ifNil: [^nil].
	self cormasModel activeInit: self listInit selection asSymbol