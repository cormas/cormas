user messages
choose: messageString labels: labels values: values default: defaultValue toHabitus: aHabitusName elseTo: anotherHabitusName
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) choose:
			messageString labels: labels values: values default: defaultValue