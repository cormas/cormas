+ utilities - code management
allTerminalClassesOf: aClassRoot
	"Purpose: Returns a collection of all the terminal classes of aClassRoot
Example: Cormas allTerminalClassesOf: Forager"
	
	^aClassRoot withAllSubclasses select: [:aClass | self isTerminal: aClass]