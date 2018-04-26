+ add-arc
newNode
	
	self nodeType = CMNodeEntity
		ifTrue: [^CMNodeEntity new]
		ifFalse: [^self newEntity: self nodeType]