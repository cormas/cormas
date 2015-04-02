user messages
targetForHabitus: aHabitusName
	"return a target for user messages, searching in the opened spatialGrids for aHabitusName or defaultly return self"
	
	^self targetForHabitus: aHabitusName or: nil