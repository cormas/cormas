+ components - managing
deleteComponents: aCollec
	"Purpose: remove IMMEDIATELY a collection of agents from the group components
Argument: aCollec = <Collection(Agent)>"
	
	| listeSet |
	listeSet := Set new.
	listeSet := aCollec.
	self components: self components - listeSet