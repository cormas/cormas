as yet unclassified
runAndVisualizeWithProbes
	| probes |
	self openWithToolbar.
	self createSimulationMenus.
	probes := OrderedCollection new.
	probes add: 'CMFireAutomataModel>>nbTrees'.
	model class setActiveProbes: probes.