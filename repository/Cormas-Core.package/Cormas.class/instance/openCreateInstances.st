model manipulation
openCreateInstances
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	CreateInstances new openOn: self cormasModel