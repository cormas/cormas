aspects
changedListProbes
	
	self cormasModelClass activeProbes: OrderedCollection new.
	self listProbes selections
		do:
			[:s | self cormasModelClass activeProbes add: (s tokensBasedOn: $>) last asSymbol]