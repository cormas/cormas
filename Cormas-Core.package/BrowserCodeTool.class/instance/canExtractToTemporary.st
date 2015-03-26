testing
canExtractToTemporary
	
	^self isEditing not
		and:
			[| node |
			node := self findNode.
			node notNil and: [node isValue]]