probes
setActiveProbes: listProbes
	| selectedClass selectedClassName |
	self activeProbes: OrderedCollection new.
	self allEntityClasses do: [ :c | c activeProbes: OrderedCollection new ].
	listProbes
		do: [ :s | 
			s = CMSimManager separator
				ifFalse: [
					selectedClassName := (s findTokens: $>) first asSymbol.
					selectedClassName = #Global
						ifTrue: [ selectedClassName := self name ].
					selectedClass := selectedClassName asClass.
					selectedClass activeProbes add: (s findTokens: $>) last asSymbol ] ]