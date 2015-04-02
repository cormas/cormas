user messages
warn: aMessage toAllHabitus: aCollectionOfHabitusNameAsString elseTo: secondChoiceHabitusName
	
	| messageSent |
	messageSent := false.
	self cormasModel openedSpatialGrids
		do:
			[:si | 
			(aCollectionOfHabitusNameAsString includes: si configName value)
				ifTrue:
					[si warn: aMessage.
					messageSent := true]].
	messageSent
		ifFalse: [self warn: aMessage toHabitus: secondChoiceHabitusName]