private-sax
startElementDelimiteur: someAttributes
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'value')
				ifTrue:
					[delimiter := attribute value asNumber.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'delimiteur tag must have an attribute called value')