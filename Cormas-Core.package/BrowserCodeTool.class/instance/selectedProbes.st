probes
selectedProbes
	"Return all probes in the current selection."
	
	| selectedText |
	self textController hasRangeSelection ifFalse: [^#()].
	selectedText := self textController text
		copyFrom: self textController selectionStartIndex
		to: self textController selectionStopIndex + 1.
	^self probesInText: selectedText