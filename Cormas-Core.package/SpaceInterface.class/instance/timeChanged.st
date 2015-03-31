drawing description
timeChanged
	"the simulation time has changed. I update the title of the window and the linked interfaces"
	
	| timeStep |
	spaceModel ifNil: [^nil].
	timeStep := spaceModel timeStep.
	self isTimeTitleDisplayed
		ifTrue:
			[self builder window
				label:
					self basicTitle , '  Time: ' , timeStep printString , ' '
						, self timeUnitName value].
	self isTimeFieldDisplayed ifTrue: [self timeField value: timeStep].
	self changed: #timeChanged