visualisation
openChartsOn: id
	
	self halt.
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	self displayChartsWin: ChartsInterface new.
	self displayChartsWin initialize: self cormasModel.	"time: self stepCounter value."
	self displayChartsWin openOn: id