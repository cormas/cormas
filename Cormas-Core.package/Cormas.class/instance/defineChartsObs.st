model observation
defineChartsObs
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self defineChartsWin: ProbesList new.
	self defineChartsWin openOn: self cormasModelClass