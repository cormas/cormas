user messages
asynchronousDo: aBlock toHabitus: aHabitusName elseTo: anotherHabitusName
	"ask aSpatialGrid for habitus named aHabitusName to execute aBlock in an asynchronous way (used for distributed cormas)
	no result expected"
	
	(self targetForHabitus: aHabitusName or: anotherHabitusName)
		asynchronousDo: aBlock