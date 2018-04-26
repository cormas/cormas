user messages
warn: aMessage toAllHabitus: aCollectionOfHabitusNameAsString
	
	aCollectionOfHabitusNameAsString
		do:
			[:aHabitusNameAsString | self warn: aMessage toHabitus: aHabitusNameAsString]