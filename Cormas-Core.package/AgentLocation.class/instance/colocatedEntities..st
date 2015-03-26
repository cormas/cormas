+ environment - sensing - agents
colocatedEntities: locatedEntityName
	"Purpose: returns all entities (except the sender) of a given type located in the same location as the receiver. (all locatedEntityName subclasses are considered).
Argument: 	locatedEntityName = <Symbol | Class>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self colocatedEntities: #Predator"
	
	| collec |
	self patch ifNil: [^nil].
	collec := self patch occupantsAt: locatedEntityName.
	(collec includes: self) ifTrue: [collec remove: self].
	^collec