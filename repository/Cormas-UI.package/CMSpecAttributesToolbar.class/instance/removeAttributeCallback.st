callbacks
removeAttributeCallback
	" Callback for adding attribute in the target class "
	
	| userAnswer |
	userAnswer := self 
		requestText: self translator tEnterAttName
		title: self translator tAppTitle.
	(self validateAttributeName: userAnswer)
	 	ifTrue: [ self openInitialValueChooser ]
		ifFalse: [ self informMessage: userAnswer , self translator tInvalidName ]