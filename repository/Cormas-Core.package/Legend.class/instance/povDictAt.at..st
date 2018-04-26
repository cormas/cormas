accessing
povDictAt: aClass at: aPovName
	
	^(self povDictAt: aClass)
		at: aPovName
		ifAbsent: [Array new]