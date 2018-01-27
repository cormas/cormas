simulate
runSimulationThreaded
	"  Loop over the STEPs until simulation end. Threaded process.
	Method called from Cormas' runButton [>II]"
	
	Processor yield.	"Terminate the others processes"
	processReplayForward isNil
		ifFalse:
			[processReplayForward terminate.
			processReplayForward := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].	"Suspend or resume current process"
	processRun isNil
		ifFalse:
			[processRun suspendedContext isNil
				ifFalse:
					[processRun suspendingList isNil
						ifFalse:
							[self simRunButton_Pause: false.
							^processRun suspend]
						ifTrue:
							[self simRunButton_Pause: true.
							^processRun resume]]].	"Create the process"	"*******************************************************************"	"**********************     RUN  threaded    *********************"
	processRun := [self runSimulation]
		forkAt: Processor userBackgroundPriority.	"  ********************       END LOOP        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self finalTime = self currentTime
		ifTrue:
			[processRun terminate.
			processRun := nil.
			self simButtonAt: #run displayActivated: false]