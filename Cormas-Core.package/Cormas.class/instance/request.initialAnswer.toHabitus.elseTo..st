user messages
request: aMessage initialAnswer: initialString toHabitus: aHabitusName elseTo: anotherHabitusName
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage initialAnswer: initialString