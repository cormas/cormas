+ init - spatial entities
loadEnvironmentFromFile: aName withPov: aSymbol
	"Purpose: create spatial elements, load attributes value specified in a defined env file and set the point of view of the elementary spatial entity to a defined pov
Argument: aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory. 
aSymbol is the name of the cell pov to be displayed
Example:	self loadEnvironmentFromFile: 'test.env' withPov: #state
Example: self loadEnvironmentFromFile: ('d:\Vw5i.4\cormas\Models\JLB\maps\test.env' asFilename) withPov: #state"
	
	self spaceModel loadEnvironmentFromFile: aName.
	self
		displayPov: aSymbol
		of: self class cellClass