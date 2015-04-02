user messages
warn: aMessage toHabitus: aHabitusNameAsString
	
	| coll |
	coll := self openedSpatialGridsForHabitus: aHabitusNameAsString.
	coll isEmpty
		ifFalse: [coll do: [:each | each warn: aMessage]]
		ifTrue:
			[self
				warn:
					'The following message could not be sent to ' , aHabitusNameAsString ,
							' because no such Habitus exists'.
			self warn: aMessage]