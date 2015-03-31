tool hotDraw
isManipulateForTabletEnabled: aBoolean
	
	aBoolean
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOn]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#isManipulateForTabletEnabled) beOff]