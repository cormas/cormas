opening and menus
runAndVisualizeWithProbes
	| probes |
	"the method is not used. Is it obsolete ?"
	self openWithToolbar.
	self createSimulationMenus.
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbTrees'.
	model class setActiveProbes: probes.