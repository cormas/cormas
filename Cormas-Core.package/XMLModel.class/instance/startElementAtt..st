private-sax
startElementAtt: someAttributes
	
	| att_id att_name att_type attribut |
	att_id := nil.
	att_name := nil.
	att_type := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'id')
				ifTrue: [att_id := attribute value]
				ifFalse:
					[(attribute key isLike: 'name')
						ifTrue: [att_name := attribute value]
						ifFalse:
							[(attribute key isLike: 'type') ifTrue: [att_type := attribute value]]]].
	(att_id isNil or: [att_name isNil or: [att_type isNil]])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'att tags must have attributes called id, name and type')].
	attribut := Dictionary new.
	attribut at: #id put: att_id.
	attribut at: #name put: att_name.
	attribut at: #type put: att_type.
	attributes add: attribut