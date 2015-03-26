temporary variables
renameTemporary
	
	| newName node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	newName := self
		request: #EnterNewNameC << #browser >> 'Enter new name:'
		initialAnswer: node name.
	newName isEmpty ifTrue: [^self].
	self
		performRefactoring:
			(self
				preloadSourceTree:
					(RenameTemporaryRefactoring
						renameTemporaryFrom:
							(self convertToSourceInterval: node sourceInterval)
						to: newName
						in: self methodClass
						selector: self selector))