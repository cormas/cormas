init
terminateAllProcesses
	"Terminate all the processes"
	
	processReplayForward isNil
		ifFalse:
			[processReplayForward terminate.
			processReplayForward := nil].
	processReplayBackward isNil
		ifFalse:
			[processReplayBackward terminate.
			processReplayBackward := nil].
	processRun isNil
		ifFalse:
			[processRun terminate.
			processRun := nil]