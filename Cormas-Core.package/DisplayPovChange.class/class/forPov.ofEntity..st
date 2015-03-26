instance creation
forPov: aSymbol ofEntity: aClass
	
	^(self new)
		povName: aSymbol;
		entityClass: aClass;
		yourself