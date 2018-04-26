+ common-pool resources
treatRequestProrataSatisfaction
	"Purpose: for all kinds of common-pool resources, performs the sharing among unsatisfied requesters according to the rule 'pro rata'
the requesting entities must have 
	- an attribute 'satisfaction', 
	- an attribute 'potentialConsumption',
	- an attribute 'consumption',
	- a procedure 'calculSatisafaction'"
	
	| lesTypesDeRessource |
	lesTypesDeRessource := Set new.
	self request
		do:
			[:tableau | 
			(lesTypesDeRessource includes: tableau first)
				ifFalse: [lesTypesDeRessource add: tableau first]].
	lesTypesDeRessource do: [:res | self treatRequestProrataSatisfaction: res]