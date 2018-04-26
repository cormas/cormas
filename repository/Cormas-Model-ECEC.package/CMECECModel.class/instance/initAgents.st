instance-creation
initAgents
	"initialize 10 foragers of each type and move then randomly on a free cell"
	
	self
		createN: self restrainedInitialNumber
		randomlyLocatedAloneEntities: CMECECRestrained.
	self
		createN: self unrestrainedInitialNumber
		randomlyLocatedAloneEntities: CMECECUnrestrained