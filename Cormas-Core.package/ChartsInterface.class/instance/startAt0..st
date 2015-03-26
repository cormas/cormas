menus
startAt0: aBool
	
	startAt0 := aBool.
	aBool
		ifTrue:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #startAt0)
				beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Option) submenu atNameKey: #startAt0)
				beOff].
	self defaultRange