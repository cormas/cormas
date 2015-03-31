changed
listMethodsChanged
	"propagate the change to cormas"
	
	cormas listMethodsChanged	"cormas spaceInterfaces 
		do: [:sp | sp spaceModel ifNotNil: [sp initMenuPov]]"