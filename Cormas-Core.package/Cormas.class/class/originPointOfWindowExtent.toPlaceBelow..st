util_window
originPointOfWindowExtent: bounds toPlaceBelow: mainWindow
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed below the specified window"
	
	| mainRectangle hackFactor screenBounds |
	hackFactor := 0 @ 34.
	mainRectangle := mainWindow getDisplayBox.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	^Point
		x:
			((mainRectangle bottomRight x + hackFactor x - bounds x
				max: screenBounds left) min: screenBounds right)
		y:
			((mainRectangle bottomRight y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)