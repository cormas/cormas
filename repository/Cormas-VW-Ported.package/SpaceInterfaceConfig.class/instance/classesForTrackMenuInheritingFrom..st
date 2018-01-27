overwrite spaceInterface
classesForTrackMenuInheritingFrom: aClass
	
	^self observedEntitiesList list select: [:c | c inheritsFrom: aClass]