user messages
warn: aMessage toHabitus: aHabitusNameAsString elseTo: secondChoiceHabitusName
	
	| coll |
	coll := self openedSpatialGridsForHabitus: aHabitusNameAsString.
	coll isEmpty
		ifTrue:
			[coll := self openedSpatialGridsForHabitus: secondChoiceHabitusName].
	coll isEmpty
		ifFalse: [coll do: [:each | each warn: aMessage]]
		ifTrue:
			[self
				warn:
					'The following message could not be sent to ' , aHabitusNameAsString ,
							' or ' , secondChoiceHabitusName ,
							' because none of these Habitus exist'.
			self warn: aMessage]