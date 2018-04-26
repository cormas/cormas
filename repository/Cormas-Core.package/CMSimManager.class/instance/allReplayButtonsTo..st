replay-private
allReplayButtonsTo: bool
	"bool = false => all replay buttons are grey and inactivate.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward  "
	
	self simButtonAt: #stepBack displayActivated: bool.
	self simButtonAt: #runBack displayActivated: bool.
	self simButtonAt: #replayRunForward displayActivated: bool.
	self simButtonAt: #replayStepForward displayActivated: bool