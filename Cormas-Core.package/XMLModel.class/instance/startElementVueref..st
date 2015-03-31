private-sax
startElementVueref: someAttributes
	
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[| vuerefs |
					vuerefs := currentView
						at: #vuerefs
						ifAbsentPut: [List new].
					vuerefs add: attribute value.
					^self]].
	self errorHandler
		fatalError:
			(InvalidSignal new
				messageText:
					#requiredAttributesNotPresent << #xml >>
							'vueref tag must have an attribute called ref')