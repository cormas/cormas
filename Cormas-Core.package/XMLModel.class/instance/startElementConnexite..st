private-sax
startElementConnexite: someAttributes
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[connexity := attribute value asNumber.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'connexite tag must have an attribute called value')