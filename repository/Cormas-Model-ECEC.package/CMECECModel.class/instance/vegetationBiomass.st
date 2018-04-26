probes
vegetationBiomass
	"return the data (a number) to be plotted as the total Biomass of the vegetation"

	<probes>
	^ self theCMECECVegetationUnits inject: 0 into: [ :i :j | i + j biomass ]