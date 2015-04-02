accessing
kernelClassNames
	
	| collec |
	collec := IndexedSet new.
	self environment allClassNames
		do: [:s | collec add: (s tokensBasedOn: $.) last].
	^collec