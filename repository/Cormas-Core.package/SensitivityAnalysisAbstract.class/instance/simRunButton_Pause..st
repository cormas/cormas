actions_buttons
simRunButton_Pause: bool
	"bool = false => display the run button [ I> II ] 
			otherwise, display as [ II ].
	buttonName = <Symbol> =  #run 
	bool = <Bollean>
		run_offIcon   -      runIcon  "
	
	| aLabel |
	bool
		ifFalse: [aLabel := #runIcon]
		ifTrue: [aLabel := #pauseIcon].
	(self builder componentAt: #runButton) isNil
		ifFalse:
			[(self builder componentAt: #runButton) label: (Cormas perform: aLabel)]