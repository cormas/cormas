instance variables
selectedVariableName
	
	| node |
	node := self findNode.
	^(node notNil and: [node isVariable])
		ifTrue: [node name]
		ifFalse: [nil]