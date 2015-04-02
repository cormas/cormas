model entities
verifyClassExist: aClassName
	
	^(self cormasModelClass environment includesKey: aClassName asSymbol)
		or:
			[(self class environment includesKey: aClassName asSymbol)
				or:
					[(Core includesKey: aClassName asSymbol)
						or: [Kernel includesKey: aClassName asSymbol]]]