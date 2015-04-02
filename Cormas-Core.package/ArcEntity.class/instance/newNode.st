+ add-arc
newNode
	
	self nodeType = NodeEntity
		ifTrue: [^NodeEntity new]
		ifFalse: [^self newEntity: self nodeType]