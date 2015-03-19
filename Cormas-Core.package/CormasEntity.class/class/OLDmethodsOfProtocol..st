as yet unclassified
OLDmethodsOfProtocol: protocolName
	"Return a set of all the methods which are in the a given protocol"

	|   coll |
	category := protocolName asSymbol.
	coll := IndexedSet new.
	(self superClassesUntil: Entity) do: 
			[:aClass | 
			coll addAll: (aClass organization listAtCategoryNamed: category) sorted].


	^coll