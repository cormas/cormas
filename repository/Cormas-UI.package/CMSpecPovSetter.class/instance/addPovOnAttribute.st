action
addPovOnAttribute
	| list choice values valuesTextLine |
	list := DefaultAttributesSetter attributsFromClass: selectedClass.
	(choice := UITheme builder
		chooseDropList: self translator tCreatePoVAtt
		title: 'CORMAS'
		list: list) ifNil: [ ^ nil ].
	self createPovOnAttribute: choice.
	self cormas currentSimulation
		ifNotNil: [ values := (self cormas currentSimulation
				allTheEntities: selectedClass)
				collect: [ :entity | entity perform: choice asSymbol ] ].
	(values isNil or: [ values size = 1 and: [ values first isNil ] ])
		ifTrue: [ ^ self ].
	valuesTextLine := ''.
	values
		do: [ :v | valuesTextLine := valuesTextLine , v printString , ' ' ].
	(self confirmAttValues: choice for: valuesTextLine)
		ifTrue: [ values do: [ :v | 
					v isSymbol
						ifTrue: [ self addSymbolPov: v asString ]
						ifFalse: [ v isString
								ifTrue: [ self addSymbolPov: v ]
								ifFalse: [ v isLiteral
										ifTrue: [ self addSymbolPov: choice , v printString ] ] ] ] ]