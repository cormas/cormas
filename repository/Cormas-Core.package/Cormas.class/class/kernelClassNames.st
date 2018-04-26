accessing
kernelClassNames
	
	| collec |
	collec := OrderedCollection new.
	self cmEnvironment allClassNames do: [ : s | collec add: (s findTokens: $.) last].
	^ collec