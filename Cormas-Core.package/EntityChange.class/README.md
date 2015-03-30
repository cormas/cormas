EntityChange is the abstract of all delayed changes used in Cormas.

Instance Variables:
	entity	<Entity>	the entity who has changed
	entityClass	<Entity class>	the class of this entity (computed on the server in case of remotly distributed change)
	entityId	<Integer>	the id of this entity (computed on the server in case of remotly distributed change)