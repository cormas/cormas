replay-backward
runBack
	"Replay the story of the stored simulation backwards, using BOS file.
Threaded process"
	
	Processor yield.	"Terminate the others processes"
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil].
	processReplayForward isNil
		ifFalse:
			[processReplayForward terminate.
			processReplayForward := nil].	"Suspend or resume current process"
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward suspendedContext isNil
				ifFalse:
					[processReplayBackward suspendingList isNil
						ifFalse: [^processReplayBackward suspend]
						ifTrue: [^processReplayBackward resume]]].	"Create the process"	"*********************************************************************************"	"**********************     RUN  Step Back threaded    *********************"
	processReplayBackward := ["***"
	[self currentTime <= 0 or: [processReplayBackward = nil]]
		whileFalse:
			[self stepBack
				ifFalse:
					[processReplayBackward terminate.
					processReplayBackward := nil.
					^nil]]	"***"] forkAt: Processor userBackgroundPriority.	"  ********************       END PROCESS ***        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self currentTime = 0
		ifTrue:
			[processReplayBackward terminate.
			processReplayBackward := nil]