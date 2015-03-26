+ accessing - entities
theAgents
	"Purpose: Returns a collection of all the agents (social entities) of the model
Example: self ask: (self theAgents) toDo: #step"
	
	| collec |
	collec := IndexedSet new.
	self class socialClasses do: [:cl | collec addAll: (self theEntities: cl)].
	^collec