private
createReadmeFile
	"create a readme file"
	
	| s |
	s := (self packagingDirectory \ 'readme.txt') writeStream.
	[s
		nextPutAll: 'Please, note the following :';
		cr;
		cr;
		nextPutAll: ' - This is a packaged version of Cormas for the Model ';
		nextPutAll: self currentModel name;
		cr;
		cr;
		nextPutAll:
				' - The Photo and Video tools require to have QuickTime installed on your computer';
		cr] ensure: [s close]