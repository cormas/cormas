temporary variables
removeParameter
	
	| node |
	node := self findNode.
	(node isNil or: [node isVariable not])
		ifTrue:
			[^self warn: #CouldNotFindTheNode << #browser >> 'Could not find the node'].
	self
		handleError:
			[| ref |
			ref := RemoveParameterRefactoring
				removeParameter: node name
				in: self methodClass
				selector: self selector.
			ref execute.
			codeModel setSelector: ref newSelector]