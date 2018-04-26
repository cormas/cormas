refactorings
inlineTemporary
	
	| node |
	self updateRequest ifFalse: [^self].
	node := self findNode.
	(node isNil or: [node isAssignment not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(InlineTemporaryRefactoring
						inline: (self convertToSourceInterval: node sourceInterval)
						from: self selector
						in: self methodClass))