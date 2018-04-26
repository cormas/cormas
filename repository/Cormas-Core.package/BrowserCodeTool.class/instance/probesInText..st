probes
probesInText: aText
	"Find all the probes embedded in the emphases of aText. Sort them by their distance from the current insertion point since every user of this so far has wanted that."
	
	| probes searchBlock |
	probes := OrderedCollection new.
	searchBlock := [:emphasis | emphasis class == ProbeCharacterStyle ifTrue: [probes add: emphasis value]].
	aText runs values
		do:
			[:value | 
			(value isKindOf: Array)
				ifTrue: [value do: [:obj | searchBlock value: obj]]
				ifFalse: [searchBlock value: value]].
	probes
		sort:
			[:a :b | 
			(a characterIndex - self textController selectionStartIndex) abs
				< (b characterIndex - self textController selectionStartIndex)].
	^probes