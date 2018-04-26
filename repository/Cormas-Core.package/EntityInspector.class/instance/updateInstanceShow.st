methods
updateInstanceShow
	
	| aFig |
	self showInstance = #selection
		ifTrue:
			[aFig := self linkedSI drawing components
				detect: [:fig | fig model entityReference = object]
				ifNone: [self halt].
			linkedSI drawing selection: aFig].
	self showInstance = #color
		ifTrue:
			[aFig := self linkedSI drawing components
				detect: [:fig | fig model entityReference = object]
				ifNone: [nil].
			aFig
				ifNotNil:
					[self instanceColor ifNil: [self chooseColor].
					aFig fillColor: self instanceColor.
					aFig invalidate]]