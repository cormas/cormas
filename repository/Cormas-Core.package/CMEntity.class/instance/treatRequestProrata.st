+ common-pool resources
treatRequestProrata
	"Purpose: for all kind of common-pool resources, perform the sharing among requesters according to the rule 'pro rata'"
	
	| lesTypesDeRessource |
	lesTypesDeRessource := Set new.	"create a set of all kind of resources"
	self request
		do:
			[:tableau | 
			(lesTypesDeRessource includes: tableau first)
				ifFalse: [lesTypesDeRessource add: tableau first]].
	lesTypesDeRessource do: [:res | self treatRequestProrata: res]