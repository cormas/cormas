init
init
	"create space and populate with restraineds and unrestraineds"
	self createGridX: 15 Y: 27 neighbourhood: 8 closed: true.
	self theCMECECVegetationUnitEPs do: [ :c |  c initBiomassRandomly].