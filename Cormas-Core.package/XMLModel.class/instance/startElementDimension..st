private-sax
startElementDimension: someAttributes
	
	| att_x att_y |
	att_x := nil.
	att_y := nil.
	someAttributes
		do:
			[:attribute | 
			(attribute key isLike: 'x')
				ifTrue: [att_x := attribute value asNumber]
				ifFalse:
					[(attribute key isLike: 'y') ifTrue: [att_y := attribute value asNumber]]].
	(att_x isNil or: [att_y isNil])
		ifTrue:
			[self errorHandler
				fatalError:
					(InvalidSignal new
						messageText:
							#requiredAttributesNotPresent << #xml >>
									'dimension tag must have attributes called x and y')].
	dimX := att_x.
	dimY := att_y