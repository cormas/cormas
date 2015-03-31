+ environment - sensing - agents
occupantsAt: locatedEntityName
	"Purpose: returns all the entities of a given type located there
Argument: locatedEntityName = <ByteSymbol | AgentLocation | ObjectLocation>
Note that the instances of subclasses ARE CONSIDERED by this method, contrarily to #occupants:
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| aClass |
	aClass := locatedEntityName isSymbol
		ifTrue: [self classFromSymbol: locatedEntityName]
		ifFalse: [locatedEntityName].
	^self occupantsType: aClass