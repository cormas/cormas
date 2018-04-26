menu-info
infoMethodDicoAt: aClass
	
	^self infoMethodDico
		at: aClass name
		ifAbsentPut: [#nil]