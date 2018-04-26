private-sax
startElementGrammaire: someAttributes
	
	| grammaire |
	grammaire := List new.
	currentView at: #grammaire put: grammaire.
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
							'grammaire tag must have an attribute called value')