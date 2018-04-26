model scheduling
openReplayWin
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	process isNil
		ifFalse:
			[process terminate.
			process := nil].
	self simManager openReplayWin