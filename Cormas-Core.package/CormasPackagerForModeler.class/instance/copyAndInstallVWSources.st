private actions
copyAndInstallVWSources
	"copy the source files since modeler has acces to all source code.
	then make a relative path in the SourceFileManager.
	ensure this work for a developer or modeler environment"
	
	| aFilename targetDir mgr sourcesFile |
	aFilename := self targetFile.
	targetDir := aFilename directory.
	targetDir ensureDirectory.
	mgr := SourceFileManager default.
	sourcesFile := (mgr allFiles at: mgr sourcesIndex) asFilename.
	sourcesFile copyTo: targetDir \ sourcesFile tail.
	mgr
		file: mgr sourcesIndex
		name: sourcesFile tail
		writable: false