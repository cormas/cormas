initialization
initializeActiveControl

	(self cormasModel activeControl
		ifNotNil: [ : m | self controlMethodList items includes: m ]
		ifNil: [ false ])
			ifTrue: [ self controlMethodList selectItem: self cormasModel activeControl ]
			ifFalse: 	 [ self controlMethodList notEmpty
				ifTrue: [ self controlMethodList selectItem: self controlMethodList items first ] ].