+ environment - sensing - agents
occupants: aClassOrClassName
	"Purpose: returns all the entities of a given class name located there
Argument: aClassOrClassName = <ByteSymbol> or a Cormas Entity Class
Note that the instances of subclasses are NOT considered by this method, contrarily to #occupantsAt: and #occupantsType: 
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| aClassName |
	aClassOrClassName isSymbol
		ifTrue: [aClassName := aClassOrClassName]
		ifFalse: [aClassName := aClassOrClassName name].
	^self theOccupants
		at: aClassName
		ifAbsentPut: [OrderedCollection new]