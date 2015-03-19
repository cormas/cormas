biology
eat
	"The forager eats a quatity of biomass of its current location. The quantity depends on the harvestRate: a proportion of biomass (50% or 99% according to forager type)"
	
	| qty |
	qty := self patch biomass * self class harvestRate.
	self energy: self energy + qty.
	self patch biomass: self patch biomass - qty