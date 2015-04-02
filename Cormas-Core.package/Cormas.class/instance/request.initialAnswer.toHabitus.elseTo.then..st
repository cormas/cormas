user messages
request: aMessage initialAnswer: initialString toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) request:
			aMessage initialAnswer: initialString then: aBlock