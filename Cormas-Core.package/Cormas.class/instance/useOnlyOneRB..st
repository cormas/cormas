accessing
useOnlyOneRB: aBoolean
	
	useOnlyOneRB := aBoolean.
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#useOnlyOneRB) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #Tools) submenu atNameKey:
					#useOnlyOneRB) beOff]