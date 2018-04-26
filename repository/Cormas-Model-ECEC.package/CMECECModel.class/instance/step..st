control
step: t
	"main step: activation of all the plants (Resource dynamics), then activation of the foragers (Agents dynamics)"
	"Resource dynamics   (because the dynamics of the plants are independants, the activation is not mixted)"
	
	self stepEntities: self theCMECECVegetationUnits.	"Agents dynamics    (because the agents may compete for plant access, the activation is randomly mixted)"
	self askRandom: CMECECForager toDo: #step.