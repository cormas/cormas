pov
povBiomass
	"return a Green Color gradient, according to #biomass"
	
	^self
		povAttribute: #biomass
		min: 0
		max: self class K
		color: Color green