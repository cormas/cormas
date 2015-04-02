user messages
request: aMessage initialAnswer: initialString toHabitus: aHabitusName
	
	^(self targetForHabitus: aHabitusName) request: aMessage initialAnswer:
			initialString