aspects
chartsList
	
	chartsList isNil ifTrue: [^chartsList := MultiSelectionInList new].
	^chartsList