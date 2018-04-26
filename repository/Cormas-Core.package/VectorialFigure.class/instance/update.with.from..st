changing
update: anAspectSymbol with: aParameter from: aSender
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	container isNil ifTrue: [^nil].
	anAspectSymbol = #stroked
		ifTrue:
			[^aParameter
				ifTrue: [self transparent]
				ifFalse: [self opaque]].
	anAspectSymbol = #lineWidth ifTrue: [^self lineWidth: aParameter].
	anAspectSymbol = #lineColor ifTrue: [^self lineColor: aParameter].
	anAspectSymbol = #deleted
		ifTrue:
			[(aSender isKindOf: TrackFigure)
				ifTrue: [^nil]
				ifFalse: [^container remove: self]].
	super update: anAspectSymbol with: aParameter from: aSender