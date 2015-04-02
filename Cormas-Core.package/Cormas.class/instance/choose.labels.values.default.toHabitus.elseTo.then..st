user messages
choose: messageString labels: labels values: values default: defaultValue toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock
	"request the user to choose from a list of options then evaluate aBlock in an asynchronous way.
	no result expected
	used for distributed cormas"
	
	^(self targetForHabitus: aHabitusName or: anotherHabitusName) choose:
			messageString labels: labels values: values default: defaultValue then:
			aBlock