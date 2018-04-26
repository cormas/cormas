visualisation
openCharts
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self cormasModel cormas isNil
		ifTrue: [^self warn: 'The model should be initialized at least once'].
	self displayChartsWin add: ChartsInterface new.
	self displayChartsWin last initialize: self cormasModel.	"time: self stepCounter value."
	self displayChartsWin last open