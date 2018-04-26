changing
update: anAspectSymbol with: aParameter from: aSender
	"Somebody has justed changed. If it is as a result of a deletion dependent then it will be #deleted."
	
	anAspectSymbol = #stroked
		ifTrue:
			[^aParameter
				ifTrue: [self transparent]
				ifFalse: [self opaque]].
	anAspectSymbol = #lineWidth ifTrue: [^self lineWidth: aParameter].
	anAspectSymbol = #lineColor ifTrue: [^self lineColor: aParameter].
	super update: anAspectSymbol with: aParameter from: aSender