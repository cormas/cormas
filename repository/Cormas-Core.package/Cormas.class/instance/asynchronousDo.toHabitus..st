user messages
asynchronousDo: aBlock toHabitus: aHabitusName
	"ask aSpatialGrid for habitus named aHabitusName to execute aBlock in an asynchronous way (used for distributed cormas)
	no result expected"
	
	(self targetForHabitus: aHabitusName) asynchronousDo: aBlock