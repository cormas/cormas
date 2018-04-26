accessing
openSecondMenu
	
	| r |
	r := self
		trackMenu: secondMenu value
		at: self sensor globalCursorPoint
		centered: true.
	r notNil ifTrue: [performer perform: r]