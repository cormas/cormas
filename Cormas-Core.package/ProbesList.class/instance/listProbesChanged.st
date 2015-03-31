changed
listProbesChanged
	
	listProbes selection = nil
		ifTrue:
			[(self menuHolder value atNameKey: #modify) disable.
			(self menuHolder value atNameKey: #delete) disable]
		ifFalse:
			[(self menuHolder value atNameKey: #modify) enable.
			(self menuHolder value atNameKey: #delete) enable]