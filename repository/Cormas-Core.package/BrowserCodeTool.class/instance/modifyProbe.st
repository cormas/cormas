probes
modifyProbe
	
	| probedMethod candidates selectedText |
	probedMethod := self selectedMethod.
	selectedText := self textController text
		copyFrom: self textController selectionStartIndex
		to: self textController selectionStopIndex + 1.
	candidates := self probesInText: selectedText.
	candidates isEmpty
		ifTrue: [candidates := self probesInText: self textController text].
	candidates first modifyIn: probedMethod