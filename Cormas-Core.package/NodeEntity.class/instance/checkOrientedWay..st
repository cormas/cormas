- way
checkOrientedWay: aCollOfNodes
	
	| nodeCurrent nodeNext |
	1
		to: aCollOfNodes size - 1
		do:
			[:i | 
			nodeCurrent := aCollOfNodes at: i.
			nodeNext := aCollOfNodes at: i + 1.
			(nodeCurrent outgoingNodes includes: nodeNext) ifFalse: [^false]].
	^true