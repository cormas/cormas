scheduling
timeChanged
	"the time has changed (time step). Method is called whenever a modification of #timeStepValue.
	Propagate the new time to the class (to be easily accessible from the agents: #currentTime) and all dependents"
	
	| newTime |
	newTime := self timeStepValue value.
	self class timeStep: newTime.
	self cormas stepCounter value: newTime.
	self changed: #timeChanged with: newTime.
	"newTime = 0 ifTrue: [^self simManager setButtonsForTime0].
	newTime = 1 ifTrue: [^self simManager setButtonsForTime1]"