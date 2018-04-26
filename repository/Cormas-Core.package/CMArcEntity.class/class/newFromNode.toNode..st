instance creation
newFromNode: startNode toNode: endNode
	
	| inst |
	inst := self newAndCollect.
	inst initFrom: startNode to: endNode.
	^inst