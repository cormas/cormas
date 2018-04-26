user messages
confirm: aMessage toHabitus: aHabitusName elseTo: anotherHabitusName then: aBlock
	"open a confirmation dialog then execute aBlock without blocking the current process.
	usefull for distributed cormas.
	no return can be expected from this method"
	
	(self targetForHabitus: aHabitusName or: anotherHabitusName) confirm:
			aMessage then: aBlock