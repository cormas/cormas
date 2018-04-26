messages
inlineMethod
	
	| node |
	node := self findNode.
	(node isNil or: [node isMessage not])
		ifTrue:
			[^self
				warn:
					#CouldNotFindMessageSend << #browser >> 'Could not find message send'].
	(node receiver isVariable
		and: [#('self' 'super') includes: node receiver name])
		ifTrue:
			[self
				performRefactoring:
					(self
						preloadSourceTree:
							(InlineMethodRefactoring
								inline: (self convertToSourceInterval: node sourceInterval)
								inMethod: self selector
								forClass: self methodClass))]
		ifFalse:
			[self
				performRefactoring:
					(self
						preloadSourceTree:
							(InlineMethodFromComponentRefactoring
								inline: (self convertToSourceInterval: node sourceInterval)
								inMethod: self selector
								forClass: self methodClass))]