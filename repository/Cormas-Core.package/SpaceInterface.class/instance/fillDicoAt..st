menu-pov
fillDicoAt: aClass
	
	^self fillDico
		at: aClass name
		ifAbsentPut: [true]