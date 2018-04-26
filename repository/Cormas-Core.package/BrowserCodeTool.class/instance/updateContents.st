updating
updateContents
	
	| compiledMethod source text |
	modified := false.
	self updateTextWidget.
	(self selectors size > 1 or: [self selectedClass isNil])
		ifTrue: [^self text: ''].
	self selector isNil
		ifTrue: [^self text: self selectedClass sourceCodeTemplate asText].
	compiledMethod := self methodClass
		compiledMethodAt: self selector
		ifAbsent:
			[self warn: #MethodHasBeenRemoved << #pdp >> 'Method has been removed'.
			^self text: ''].
	source := self methodClass
		sourceCodeForMethod: compiledMethod
		at: self selector.
	text := self formatSource: source for: compiledMethod.
	self text: text.
	self updateSelection