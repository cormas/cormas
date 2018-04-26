actions
doPackaging
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation"
	
	super doPackaging.
	self openAndPlaceSimulationGUI.
	self rebuildMainMenu.
	self copyModelFiles.
	self disableComServerExamples.	"self createRuntimePackager.
	self installPatchRes94469."
	self installNotifierChanges.	"self configurePackager."	"self executePackager"
	self suppressEmergencyEvaluator.
	self suppressVisualLauncherShortcut.
	self changeDefaultCOMDirectory.
	self saveThenQuitImage