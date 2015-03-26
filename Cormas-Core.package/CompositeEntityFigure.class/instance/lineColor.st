accessing
lineColor
	
	^(attributes isNil or: [attributes lineColor isNil])
		ifTrue:
			[container isNil
				ifTrue: [self fillColor]
				ifFalse: [container lineColor]]
		ifFalse: [attributes lineColor]