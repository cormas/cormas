utilities - files
getAttributesType: attributes fromInstances: instanceCollection
	
	| firstInstance firstValue type dicoAttConv |
	dicoAttConv := Dictionary new.
	attributes
		do:
			[:att | 
			firstInstance := instanceCollection
				detect: [:p | (p perform: att asSymbol) isNil not]
				ifNone: [nil].
			firstInstance isNil
				ifTrue: [firstValue := nil]
				ifFalse: [firstValue := firstInstance perform: att asSymbol].
			firstValue isSymbol
				ifTrue:
					[type := '(Symbol)'.
					dicoAttConv
						at: att asSymbol
						put: #(#asString '(Symbol)')]
				ifFalse:
					[firstValue cormasHelper isTypeNumber
						ifTrue:
							[type := '(Number)'.
							dicoAttConv
								at: att asSymbol
								put: #(#printString '(Number)')]
						ifFalse:
							[firstValue isString
								ifTrue:
									[type := '(String)'.
									dicoAttConv
										at: att asSymbol
										put: #(#asString '(String)')]
								ifFalse:
									[firstValue cormasHelper isTypeBoolean
										ifTrue:
											[type := '(Boolean)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(Boolean)')]
										ifFalse:
											[type := '(nil)'.
											dicoAttConv
												at: att asSymbol
												put: #(#printString '(nil)')]]]]].
	^dicoAttConv