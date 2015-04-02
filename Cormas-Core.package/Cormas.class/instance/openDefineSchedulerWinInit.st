model scheduling
openDefineSchedulerWinInit
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse:
			[self
				edit: self cormasModelClass
				pov: #init]