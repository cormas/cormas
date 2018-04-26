enabled/disabled
enable
	"Enable the receiver (make is selectable).  When enabled it
	 can be selected on the menu (if its visible)."
	
	(enabled isKindOf: ValueModel)
		ifTrue: [enabled value: true]
		ifFalse: [self enabled: true]