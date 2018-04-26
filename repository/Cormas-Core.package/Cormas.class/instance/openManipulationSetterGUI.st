model manipulation
openManipulationSetterGUI
	
	self cormasModelClass isNil ifTrue: [^self alert_NewModel].
	ManipulationSetter new openOn: self cormasModelClass