+ user interface
openAnotherInterfaceWithHabitusName: aString
	"Purpose: open programmaticaly a space interface window and load a specified habitus for it
If a spaceInterface with a habitus of the same name is already open, a new spaceInterface with the same habitus is open.
Argument: aSymbol = <aSymbol> that corresponds to a habitus name previously defined
Example: self openAnotherInterfaceWithHabitusName:'Farmer'    "
	
	self
		loadHabitusName: aString
		forInterface: self openASpaceInterface