drawing description
displayTimeField
	"the simulation time is displayed in the field"
	
	| timeStep timeFieldMenu |
	timeFieldMenu := ((self menuHolder value atNameKey: #display) submenu
		atNameKey: #time) submenu atNameKey: #timeField.
	self isTimeFieldDisplayed: self isTimeFieldDisplayed not.
	self isTimeFieldDisplayed
		ifTrue:
			[(self builder componentAt: #timeUnitName) beVisible.
			(self builder componentAt: #timeField) beVisible.
			timeStep := spaceModel cormasModel timeStep.
			self timeField value: timeStep.
			timeFieldMenu beOn]
		ifFalse:
			[(self builder componentAt: #timeUnitName) beInvisible.
			(self builder componentAt: #timeField) beInvisible.
			timeFieldMenu beOff]