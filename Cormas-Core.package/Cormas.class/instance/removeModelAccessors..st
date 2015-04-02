model entities
removeModelAccessors: aName
	
	| pop |
	pop := 'the' , aName , 's'.
	(self cormasModelClass instVarNames includes: pop)
		ifTrue: [self cormasModelClass removeInstVarName: pop].
	(self cormasModelClass selectors includes: pop asSymbol)
		ifTrue: [self cormasModelClass removeSelector: pop asSymbol].
	(self cormasModelClass selectors includes: (pop , ':') asSymbol)
		ifTrue: [self cormasModelClass removeSelector: (pop , ':') asSymbol].
	(self cormasModelClass selectors
		includes: ('allThe' , aName , 's') asSymbol)
		ifTrue:
			[self cormasModelClass removeSelector: ('allThe' , aName , 's') asSymbol]