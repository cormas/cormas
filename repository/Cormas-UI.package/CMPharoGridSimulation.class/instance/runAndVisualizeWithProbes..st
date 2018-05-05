opening and menus
runAndVisualizeWithProbes: probes
	"the method is not used. Is it obsolete ?"

	self openWithToolbar.
	self createSimulationMenus.
	model class setActiveProbes: probes.