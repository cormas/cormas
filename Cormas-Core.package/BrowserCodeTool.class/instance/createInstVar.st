temporary variables
createInstVar
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(TemporaryToInstanceVariableRefactoring
				class: self methodClass
				selector: self selector
				variable: node name)