- probes
colorOfProbe: aProbeSymbol
	"answer the color of a local probe (to display the curve in ChartsInterface)"
	
	| selectorName |
	selectorName := (#colorOfProbe_ , aProbeSymbol) asSymbol.
	self class methodDictionary
		at: selectorName
		ifAbsent: [^nil].
	^self perform: selectorName