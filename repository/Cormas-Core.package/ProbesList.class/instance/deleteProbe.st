action
deleteProbe
	
	| class attributeName source |
	(self listProbes selection notNil
		and: [self listEntities selection notNil])
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].
			attributeName := self listProbes selection.
			(Cormas current
				confirm:
					(UserMessage defaultString: 'Remove this probe ?' key: #confirmRemoveProbe))
				ifTrue:
					[(class instVarNames includes: attributeName asString)
						ifFalse: [class removeSelector: attributeName]
						ifTrue:
							[source := (class compiledMethodAt: attributeName) getSource.
							class removeSelector: attributeName.
							class compile: source classified: 'accessing' notifying: nil]].
			self listEntitiesChanged]