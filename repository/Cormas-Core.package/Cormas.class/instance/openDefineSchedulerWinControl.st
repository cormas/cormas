model scheduling
openDefineSchedulerWinControl
	
	self cormasModelClass isNil
		ifTrue: [^self alert_NewModel]
		ifFalse:
			[self
				edit: self cormasModelClass
				pov: #step:]