actions
refreshEachStep: aBool
	
	refreshEachStep := aBool.
	aBool
		ifTrue: [(self menuHolder value atNameKey: #refreshEachStep) beOn]
		ifFalse: [(self menuHolder value atNameKey: #refreshEachStep) beOff]