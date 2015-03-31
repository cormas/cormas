private-sax
startElementClasse: someAttributes
	
	| att_name att_url agentClass |
	att_name := nil.
	att_url := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'name')
				ifTrue: [att_name := attribute value]
				ifFalse:
					[(attribute key isLike: 'url') ifTrue: [att_url := attribute value]]].
	(att_name isNil or: [att_url isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'class tag must have attributes called name and url')].
	agentClass := Dictionary new.
	agentClass
		at: #url value
		put: att_url.
	agents at: att_name put: agentClass