simulation
runStepByStep
	
	self cormasModel isNil ifTrue: [^nil].
	self stepCounter value = self cycle value
		ifTrue: [self cycle value: self cycle value + 1].
	self obsWin isNil
		ifFalse:
			[self obsWin window isOpen
				ifTrue:
					[self eraseLinks isNil
						ifFalse:
							[self eraseLinks ifTrue: [self obsWin observateur modeleObs actionClear]]]].
	xmlModel isNil
		ifFalse:
			["Handle the beginning of the step for the XMLModel"
			xmlModel startStep].
	exportPlaybackLog
		ifTrue:
			["Write map to the log"
			xmlModel writeMapToPlaybackLog].
	Processor yield.	"  **************************************************"	"  ******************   RUN Step   ****************"	"**"
	self simManager runStepByStep.	"**"	"  ********************    Done   ******************"	"  **************************************************"
	self makeVideo.
	useExternalVisualization
		ifTrue:
			["Send map to external visualization module via XML-RPC"
			xmlModel sendMapToExternalVisualizer].
	xmlModel isNil
		ifFalse:
			["Handle the end of the step in for the XML Model"
			xmlModel endStep]