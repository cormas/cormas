+ environment - sensing - agents
allOccupants
	"Purpose: returns all the entities located there
Return value: <Collection(AgentLocation & ObjectLocation)>"
	
	| collec |
	collec := OrderedCollection new.
	self theOccupants values do: [:v | collec addAll: v].
	^collec