testing
isCollection
	
	| aV |
	aV := self entity perform: self name asSymbol.
	^aV isCollection and: [aV isSymbol not and: [aV isString not]]