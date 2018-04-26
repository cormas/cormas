+ accessing - entities
theAgents
	"Purpose: Returns a collection of all the agents (social entities) of the model
Example: self ask: (self theAgents) toDo: #step"
	
	| collection |
	collection := OrderedCollection new.
	self class socialClasses do: [:cl | collection addAll: (self theEntities: cl)].
	^collection