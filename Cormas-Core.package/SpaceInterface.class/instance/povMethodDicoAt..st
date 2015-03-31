menu-pov
povMethodDicoAt: aClass
	
	^self povMethodDico
		at: aClass name
		ifAbsentPut: [#nil]