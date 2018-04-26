actions
executePerformBar
	
	self
		evaluateText: self performBar value
		from: nil
		ifFail: [^false].
	self updateValues.
	^true