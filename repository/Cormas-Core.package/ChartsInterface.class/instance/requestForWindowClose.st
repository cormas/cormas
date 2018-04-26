interface opening
requestForWindowClose
	
	cormasModel cormas isNil
		ifFalse:
			[cormasModel cormas displayChartsWin
				remove: self
				ifAbsent: [nil]].
	cormasModel := nil.
	^super requestForWindowClose