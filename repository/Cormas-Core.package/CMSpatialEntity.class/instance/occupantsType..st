+ environment - sensing - agents
occupantsType: aClass
	"Purpose: returns all the entities of a given type located there
Argument: locatedEntityName = <AgentLocation | ObjectLocation>
Note that the instances of subclasses ARE CONSIDERED by this method, contrarily to #occupants:
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| instances |
	instances := OrderedCollection new.
	aClass ifNil: [^instances].
	aClass withAllSubclasses
		do: [:class | instances addAll: (self occupants: class name)].
	^instances