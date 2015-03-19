as yet unclassified
colocatedEntities: locatedEntityName 
"Purpose: returns all entities of a given type located in the same location as the receiver.
Argument: 	locatedEntityName = <Symbol | Class>
Return value: <Collection(AgentLocation | ObjectLocation)>
Example: self colocatedEntities: #Predator"

| collec |
	self patch ifNil: [^nil].
	collec := self patch occupantsAt: locatedEntityName.
	(collec includes: self) ifTrue: [collec remove: self].
	^collec