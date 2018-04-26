init
terminateAllProcesses
	processReplayForward isNil
		ifFalse: [ processReplayForward terminate.
			processReplayForward := nil ].
	processReplayBackward isNil
		ifFalse: [ processReplayBackward terminate.
			processReplayBackward := nil ].
	processRun isNil
		ifTrue: [ ^ self ].
	processRun terminate.
	processRun := nil