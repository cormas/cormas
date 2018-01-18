control
newState
"Each cell has a small probability of changing its state "
	self seed: false.
	Cormas random < 5.0e-3 ifTrue: 
			[self tree 
				ifTrue: 
					[self tree: false.
					self seed: nil]
				ifFalse: 
					[self tree: true.
					self seed: true]]