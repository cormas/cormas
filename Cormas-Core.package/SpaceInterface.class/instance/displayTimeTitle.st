drawing description
displayTimeTitle
	"the simulation time is displayed in the title of the window"
	
	| timeStep timeTitleMenu |
	timeTitleMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeTitle.
	self isTimeTitleDisplayed: self isTimeTitleDisplayed not.
	self isTimeTitleDisplayed
		ifTrue:
			[timeStep := spaceModel cormasModel timeStepWithUnit.
			self builder window label: self basicTitle , '  Time: ' , timeStep.
			timeTitleMenu beOn]
		ifFalse:
			[self builder window label: self basicTitle.
			timeTitleMenu beOff]