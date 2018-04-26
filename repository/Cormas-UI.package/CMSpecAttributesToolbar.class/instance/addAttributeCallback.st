callbacks
addAttributeCallback
	" Callback for adding attribute in the target class "
	
	| userAnswer |
	userAnswer := self 
		requestText: self translator tEnterAttName
		title: self translator tAppTitle.
	(self validateAttributeName: userAnswer)
	 	ifTrue: [ CMSpecInitialValueChooser openFor: self projectManager ]
		ifFalse: [ 
			userAnswer 
				ifNotNil: [ self informMessage: userAnswer , self translator tInvalidName ] ]