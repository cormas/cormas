aspects
changedStepMethod
	
	self listControle selection ifNil: [^nil].
	self cormasModel activeControl: self listControle selection asSymbol