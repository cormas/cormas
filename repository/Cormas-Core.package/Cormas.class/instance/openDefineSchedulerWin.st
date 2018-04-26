model scheduling
openDefineSchedulerWin
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse: [self edit: self currentModel]