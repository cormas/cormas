adding-removing
removeAllFiguresOf: aClass
	
	aClass withAllSubclasses
		do: [:cl | self removeAll: (self figuresOfEntity: cl)]