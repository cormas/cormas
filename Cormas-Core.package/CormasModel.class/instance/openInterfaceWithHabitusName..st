+ user interface
openInterfaceWithHabitusName: aString
	"Purpose: open programmaticaly a space interface window and load a specified habitus for it
If a spaceInterface with a habitus of the same name is already open, it doesn't open a new spaceInterface, but it reloads the specified habitus for this spaceInterface instead.
Argument: aSymbol = <aSymbol> that corresponds to a habitus name previously defined
Example: self openInterfaceWithHabitusName:#Forester"
	
	| collec |
	collec := self openedSpatialGridsForHabitus: aString.
	collec isEmpty
		ifTrue: [self openAnotherInterfaceWithHabitusName: aString]
		ifFalse:
			[collec do: [:si | self loadHabitusName: aString forInterface: si]]