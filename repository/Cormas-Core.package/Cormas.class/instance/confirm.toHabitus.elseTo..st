user messages
confirm: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) confirm:
			aMessage