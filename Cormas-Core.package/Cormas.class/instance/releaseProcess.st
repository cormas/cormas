simulation
releaseProcess
	
	process isNil
		ifFalse:
			[process terminate.
			process := nil].	"self runButtonLabel: 'Run'"
	self runButtonRun