user messages
targetForHabitus: aHabitusName or: anotherHabitusName
	"return a target for user messages, searching in the opened spatialGrids for aHabitusName, or for anotherHabitusName or defaultly return self"
	
	| targets |
	targets := self openedSpatialGridsForHabitus: aHabitusName.
	(targets isEmpty and: [anotherHabitusName notNil])
		ifTrue:
			[targets := self openedSpatialGridsForHabitus: anotherHabitusName].
	targets size = 1 ifTrue: [^targets first].
	targets isEmpty
		ifTrue:
			[self warn: 'No habitus named <1s> or <2s>. Using Cormas' with:
					aHabitusName with: anotherHabitusName.
			^self].
	^Dialog
		choose:
			('Multiple habitus named <1s> or <2s>. Please chose one' expandMacrosWith:
					aHabitusName with: anotherHabitusName)
		fromList: targets
		values: targets
		lines: 5
		cancel: [^self]