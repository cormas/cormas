refactorings
extractToTemp
	
	| newName node |
	self updateRequest ifFalse: [^self].
	node := self findNode.
	(node isNil or: [node isValue not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	newName := self
		request:
			#EnterNameForTemporaryC << #browser >> 'Enter name forTemporary:'.
	newName isEmpty ifTrue: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(ExtractToTemporaryRefactoring
						extract: (self convertToSourceInterval: node sourceInterval)
						to: newName
						from: self selector
						in: self methodClass))