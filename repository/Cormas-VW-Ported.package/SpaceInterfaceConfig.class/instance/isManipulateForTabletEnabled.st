accessing
isManipulateForTabletEnabled
	
	^isManipulateForTabletEnabled
		ifNil:
			[isManipulateForTabletEnabled := ((builder menuAt: #displayOptionsMenu)
				value atNameKey: #toggleTouchpadMode) isOn]