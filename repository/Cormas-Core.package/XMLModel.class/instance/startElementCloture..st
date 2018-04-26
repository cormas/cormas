private-sax
startElementCloture: someAttributes
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[boundaries := attribute value asSymbol.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'cloture tag must have an attribute called value')