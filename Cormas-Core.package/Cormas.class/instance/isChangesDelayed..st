accessing
isChangesDelayed: aBoolean
	
	isChangesDelayed := aBoolean.
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#isChangesDelayed) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#isChangesDelayed) beOff]