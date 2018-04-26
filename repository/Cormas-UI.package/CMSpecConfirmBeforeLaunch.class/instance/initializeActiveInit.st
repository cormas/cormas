initialization
initializeActiveInit

	(self cormasModel activeInit
		ifNotNil: [ : m | self initMethodList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self initMethodList selectItem: self cormasModel activeInit ]
			ifFalse: 	 [ self initMethodList items notEmpty
				ifTrue: [ self initMethodList selectItem: self initMethodList first ] ].