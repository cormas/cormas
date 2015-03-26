+ init - spatial entities
loadEnvironmentFromFile: aName
	"Purpose: create spatial elements and load attributes value specified in a defined env file
Argument: aName = <String> or aName = <Filename> . If aName = <String>, it creates a Filename from maps directory.
Example:	self loadEnvironmentFromFile: 'test.env'
Example: self loadEnvironmentFromFile: ('d:\Vw5i.4\cormas\Models\JLB\maps\test.env' asFilename)"
	
	self spaceModel loadEnvironmentFromFile: aName