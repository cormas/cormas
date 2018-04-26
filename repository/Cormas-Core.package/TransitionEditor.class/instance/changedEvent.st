changing
changedEvent
	
	(#(#keyPress #keyRelease) includes: self eventType value)
		ifTrue:
			[self
				disableAll: #(#figure);
				enableAll: #(#toolCondition);
				enableAll: #(#character)]
		ifFalse:
			[self
				enableAll: #(#figure);
				enableAll: #(#toolCondition);
				disableAll: #(#character)]