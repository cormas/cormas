ESE initialize-release
loadEnvironmentFromFile: aName withPov: aSymbol
	"Load a grid stored as filename and display a POV on each opened grid.
	aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
	Example:	aName = 'test.env' "
	
	self loadEnvironmentFromFile: aName.
	self
		displayPov: aSymbol
		of: self cellClass