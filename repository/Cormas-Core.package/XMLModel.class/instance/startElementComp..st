private-sax
startElementComp: someAttributes
	
	| grammaire |
	grammaire := currentView at: #grammaire.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[grammaire add: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'comp tag must have an attribute called value')