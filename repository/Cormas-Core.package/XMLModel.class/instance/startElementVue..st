private-sax
startElementVue: someAttributes
	
	| att_type att_id |
	att_type := nil.
	att_id := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'type')
				ifTrue: [att_type := attribute value]
				ifFalse:
					[(attribute key isLike: 'id') ifTrue: [att_id := attribute value]]].
	(att_type isNil or: [att_id isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'vue tag must have attributes called type and id')].
	currentView := Dictionary new.
	currentView at: #type put: att_type.
	views at: att_id put: currentView