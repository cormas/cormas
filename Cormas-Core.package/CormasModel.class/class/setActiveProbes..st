probes
setActiveProbes: listProbes
	
	| selectedClass |
	self activeProbes: OrderedCollection new.
	self allClasses do: [:c | c activeProbes: OrderedCollection new].
	listProbes
		do:
			[:s | 
			s = SimManager separator
				ifFalse:
					[selectedClass := self environment at: (s tokensBasedOn: $>) first asSymbol.
					selectedClass activeProbes add: (s tokensBasedOn: $>) last asSymbol]]