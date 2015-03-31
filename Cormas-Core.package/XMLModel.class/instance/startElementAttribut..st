private-sax
startElementAttribut: someAttributes
	
	| att_ref attribut |
	att_ref := nil.
	attribut := Dictionary new.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'ref')
				ifTrue:
					[att_ref := attribute value.
					attribut at: #ref put: att_ref]
				ifFalse:
					[(attribute key isLike: 'couleur')
						ifTrue:
							[attribut
								at: #couleur
								put: attribute value]
						ifFalse:
							[(attribute key isLike: 'modif')
								ifTrue:
									[attribut
										at: #modif
										put: attribute value asBoolean]
								ifFalse:
									[(attribute key isLike: 'url')
										ifTrue:
											[attribut
												at: #url
												put: attribute value]]]]].
	att_ref isNil
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'attribut tag must have an attribute called ref')].
	currentView at: #attribut put: attribut