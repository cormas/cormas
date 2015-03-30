+ common-pool resources
treatRequestOrder
	"Purpose: for all kind of common-pool resources, perform the sharing among requesters according to the rule 'first demand first served'"
	
	| theKindOfResources |
	theKindOfResources := Set new.	"create a set of all kind of resources"
	self request
		do:
			[:table | 
			(theKindOfResources includes: table first)
				ifFalse: [theKindOfResources add: table first]].
	theKindOfResources do: [:res | self treatRequestOrder: res]