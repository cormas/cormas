accessing
qty: anObject
	qty := anObject.
	qty > 0
		ifTrue: [ CMDiffuseCell scheduler newActiveCells add: self ]
		ifFalse: [ CMDiffuseCell scheduler noMoreActiveCells add: self ].
	self
		defineVisualState;
		show