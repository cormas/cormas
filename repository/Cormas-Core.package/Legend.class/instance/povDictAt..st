accessing
povDictAt: aClass
	
	^self povDict
		at: aClass
		ifAbsentPut: [Dictionary new]