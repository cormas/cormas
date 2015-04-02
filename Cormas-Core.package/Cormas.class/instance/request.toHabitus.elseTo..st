user messages
request: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage