actions
doPackaging
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation"
	
	super doPackaging.
	self ensureRuntimePackagerLoaded.
	self copyParcelsSources.
	self copyAndInstallVWSources.
	self changeDefaultCOMDirectory.
	self saveThenQuitImage