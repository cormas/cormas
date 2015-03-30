enabled/disabled
disable
	"Disable (make unselectable) the receiver.  When disabled it can't
	 be selected on a menu (but it will still appear if its visible)."
	
	(enabled isKindOf: ValueModel)
		ifTrue: [enabled value: false]
		ifFalse: [self enabled: false]