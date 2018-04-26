changed
listMethodsChanged
	"propagate the change to cormas"
	
	self cormas listMethodsChanged	
	"cormas spaceInterfaces 
		do: [:sp | sp spaceModel ifNotNil: [sp initMenuPov]]"