model manipulation
openManipulationGUI
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].	"	ManipulateInstances isWinOpen ifFalse:["	"x := "
	ManipulateInstances new openOn: self cormasModel	"x cormas: self]"