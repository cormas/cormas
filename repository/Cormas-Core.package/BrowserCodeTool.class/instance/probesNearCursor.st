probes
probesNearCursor
	"Return all probes that are near the cursor (when nothing is selected), where 'near' is defined as within 7 characters of the position either way. If we have multiple, only return the closest."
	
	| probes nearCursorText |
	self textController hasRangeSelection ifTrue: [^#()].
	nearCursorText := self textController text
		copyFrom: (self textController selectionStartIndex - 7 max: 1)
		to:
			(self textController selectionStopIndex + 7
				min: self textController text size).
	probes := self probesInText: nearCursorText.
	probes
		sort:
			[:a :b | 
			(a characterIndex - self textController selectionStartIndex) abs
				< (b characterIndex - self textController selectionStartIndex)].
	^probes isEmpty
		ifTrue: [probes]
		ifFalse: [probes first: 1]