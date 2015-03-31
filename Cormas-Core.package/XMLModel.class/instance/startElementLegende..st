private-sax
startElementLegende: someAttributes
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[currentView
						at: #legende
						put: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'legende tag must have an attribute called ref')