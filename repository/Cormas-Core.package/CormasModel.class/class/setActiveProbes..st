probes
setActiveProbes: listProbes
	
	| selectedClass |
	self activeProbes: OrderedCollection new.
	self allEntityClasses do: [:c | c activeProbes: OrderedCollection new].
	listProbes do: [ : s | 
			s = CMSimManager separator
				ifFalse: [
					selectedClass := (s findTokens: $>) first asSymbol asClass.
					selectedClass activeProbes add: (s findTokens: $>) last asSymbol]]