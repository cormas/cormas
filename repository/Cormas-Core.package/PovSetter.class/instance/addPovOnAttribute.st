action
addPovOnAttribute
	
	| list choice values valuesTextLine |
	list := DefaultAttributesSetter attributsFromClass: selectedClass.
	choice := Dialog
		choose: 'Create Pov on which attribute?'
		fromList: list
		values: list
		lines: 8
		cancel: [nil].
	choice ifNil: [^nil].
	self createPovOnAttribute: choice.
	self cormas currentSimulation
		ifNotNil:
			[values := (self cormas currentSimulation allTheEntities: selectedClass)
				collect: [:entity | entity perform: choice asSymbol]].
	(values isNil or: [values size = 1 and: [values first isNil]])
		ifFalse:
			[valuesTextLine := ''.
			values do: [:v | valuesTextLine := valuesTextLine , v printString , ' '].
			(self cormas
				confirm:
					'Cormas found the following values for the attribute ' , choice ,
							'.
' , valuesTextLine ,
							'
Do you want to create the symbols associated to these values?')
				ifTrue:
					[values
						do:
							[:v | 
							v isSymbol
								ifTrue: [self addSymbolPov: v asString]
								ifFalse:
									[v isString
										ifTrue: [self addSymbolPov: v]
										ifFalse:
											[v isLiteral ifTrue: [self addSymbolPov: choice , v printString]]]]]]