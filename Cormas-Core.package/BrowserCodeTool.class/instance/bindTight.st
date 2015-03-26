temporary variables
bindTight
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(MoveVariableDefinitionRefactoring
						bindTight: (self convertToSourceInterval: node sourceInterval)
						in: self methodClass
						selector: self selector))