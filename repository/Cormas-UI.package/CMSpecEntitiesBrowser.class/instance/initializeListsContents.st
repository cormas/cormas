initialization
initializeListsContents

	#('Spatial' 'Social' 'Passive')
		do: [ : aType | 
			| typeSelector |
			typeSelector := (aType asLowercase , 'List') asSymbol.
			"selectionInList := self perform: typeSelector."
			(self perform: typeSelector) items: (self initializeListsContents: aType) ]