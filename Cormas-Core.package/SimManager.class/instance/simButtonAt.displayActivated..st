replay-private
simButtonAt: buttonName displayActivated: bool
	"bool = false => display the buttonName in grey color and inactivate it, 
			otherwise, display the button in red or green and activate it.
	buttonName = <Symbol> = #step #stepBack #run #runBack #replayRunForward #replayStepForward 
	bool = <Bollean>

List of buttons : runBackButton stepBackButton <--  Time  --> replayStepForwardButton replayRunForwardButton stepButton runButton 
List of icons : 
		runBack_offIcon     -     runBackIcon
		stepBack_offIcon   -   stepBackIcon
		replayStepForwardIcon  - ->   replayStepForward_offIcon (= step_offIcon)
		replayRunForwardIcon   - ->  replayRunForward_offIcon (= run_offIcon)
		step_offIcon    -    stepIcon
		run_offIcon   -      runIcon
"
	
	| aLabel aButtonName |
	(#(#step #stepBack #run #runBack #replayRunForward #replayStepForward)
		includes: buttonName) ifFalse: [self halt].
	aLabel := buttonName.
	aButtonName := buttonName.
	bool ifFalse: [aLabel := aLabel , '_off'].
	aLabel := (aLabel , #Icon) asSymbol.
	aButtonName := (aButtonName , #Button) asSymbol.	"Dev todo: 'Ancienne m√©thode pour simInterface independante'.  "	"self cormas simulationWin controller notNil 
		ifTrue: 
			[self simulationWin controller closeAndUnschedule.
			self simulationWin: nil]."
	(self cormas mainBuilder componentAt: aButtonName) isNil
		ifFalse:
			[(self cormas mainBuilder componentAt: aButtonName)
				label: (Cormas perform: aLabel)]