+ utilities - classes
allTerminalClasses
	"Purpose: returns the terminal classes of the class sender
Return value: anOrderedCollection
Example: LandCover allTerminalClasses"
	
	^self withAllSubclasses select: [:aClass | Cormas isTerminal: aClass]