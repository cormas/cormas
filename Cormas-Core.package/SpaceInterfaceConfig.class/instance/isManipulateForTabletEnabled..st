accessing
isManipulateForTabletEnabled: aBoolean
	
	| menuDyn |
	isManipulateForTabletEnabled := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey:
					#toggleTouchpadMode.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	self spaceInterface isManipulateForTabletEnabled = aBoolean
		ifFalse: [self spaceInterface isManipulateForTabletEnabled: aBoolean]