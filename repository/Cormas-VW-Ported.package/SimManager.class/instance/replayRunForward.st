replay-forward
replayRunForward
	"Replay the stored simulation history forward using BOS file.
	Threaded process"
	
	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].	"Suspend or resume current process"
	processReplayForward isNil
		ifFalse:
			[processReplayForward suspendedContext isNil
				ifFalse:
					[processReplayForward suspendingList isNil
						ifFalse: [^processReplayForward suspend]
						ifTrue: [^processReplayForward resume]]].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Forward threaded    *********************"
	processReplayForward := ["***"
	[self currentTime < self traceSize or: [processReplayForward = nil]]
		whileTrue:
			[self replayStepForward
				ifFalse:
					[processReplayForward terminate.
					processReplayForward := nil.
					^nil]]	"***"] forkAt: Processor userBackgroundPriority.	"  *********************       END PROCESS ***        ************************"	"*********************************************************************************"	"Normaly, the instructions below are not called, because #terminate (called on process) will leave this current method"
	self finalTime = self currentTime
		ifTrue:
			[processReplayForward terminate.
			processReplayForward := nil]