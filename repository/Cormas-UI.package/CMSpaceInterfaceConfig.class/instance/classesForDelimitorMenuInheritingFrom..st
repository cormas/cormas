overwrite spaceInterface
classesForDelimitorMenuInheritingFrom: aClass
	
	^self observedEntitiesList list select: [:c | c inheritsFrom: aClass]