actions
doPackaging
	"execute the packaging procedure.
	produce a directory with all files necessary for a standalone installation	"
	
	self copyVMFiles.
	self createReadmeFile.
	self closeExtrasWindows.
	self unloadExtrasParcels.
	Cormas runtimeMode: self targetRuntimeMode