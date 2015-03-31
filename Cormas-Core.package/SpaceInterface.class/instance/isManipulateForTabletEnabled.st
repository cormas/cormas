tool hotDraw
isManipulateForTabletEnabled
	
	^((self menuHolder value atNameKey: #option) submenu atNameKey:
			#isManipulateForTabletEnabled) isOn