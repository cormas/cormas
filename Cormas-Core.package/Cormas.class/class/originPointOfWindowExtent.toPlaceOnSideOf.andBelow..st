util_window
originPointOfWindowExtent: bounds toPlaceOnSideOf: mainWindow andBelow: secWindow
	" Return the preferred position for the origin (upper right) corner of the window extent receiver so that it is placed on the left or on the right side of the specified window and below another specifed window"
	
	| mainRectangle hackFactor screenBounds secRectangle |
	hackFactor := 16 @ 34.
	mainRectangle := mainWindow getDisplayBox.
	secRectangle := secWindow getDisplayBox.
	screenBounds := mainWindow == nil
		ifTrue: [Screen default bounds]
		ifFalse: [mainWindow screen bounds].
	^Point
		x:
			(mainRectangle topLeft x - bounds x - hackFactor x < 0
				ifFalse:
					[(mainRectangle topLeft x - bounds x - hackFactor x max: screenBounds left)
						min: screenBounds right]
				ifTrue: [mainRectangle topRight x + hackFactor x])
		y:
			((secRectangle bottomRight y + hackFactor y max: screenBounds top)
				min: screenBounds bottom)