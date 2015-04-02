util_window
originPointOfWindowExtent: bounds toPlaceOnSideOf: mainWindow
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed on the left or on the right side of the specified window"
	
	| mainRectangle hackFactor screenBounds |
	hackFactor := 16 @ 0.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	mainRectangle := mainWindow getDisplayBox.
	^Point
		x:
			(mainRectangle topLeft x - bounds x - hackFactor x < 0
				ifFalse:
					[(mainRectangle topLeft x - bounds x - hackFactor x max: screenBounds left)
						min: screenBounds right]
				ifTrue: [mainRectangle topRight x + hackFactor x])
		y:
			((mainRectangle topLeft y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)