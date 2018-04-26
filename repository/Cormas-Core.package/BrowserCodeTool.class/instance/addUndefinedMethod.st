menu
addUndefinedMethod
	
	| node newString targetClass |
	self updateRequest ifFalse: [^self].
	node := self findPotentialMNU.
	newString := self newMethodPatternFrom: node.
	targetClass := node receiver
		messageSearchClassFromScope: self selectedClass.
	targetClass == self selectedClass
		ifFalse: [self navigator selectClass: targetClass].
	self text: newString.
	self textController selectAt: newString size + 2