probes
setActiveProbes: listProbes
	
	| selectedClass |
	self activeProbes: OrderedCollection new.
	self allEntityClasses do: [:c | c activeProbes: OrderedCollection new].
	listProbes do: [ : s | 
			s = CMSimManager separator
				ifFalse: [
					selectedClass := self cmEnvironment at: (s findTokens: $>) first asSymbol.
					selectedClass activeProbes add: (s findTokens: $>) last asSymbol]]