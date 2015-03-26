accepting
accept: aText from: aController
	
	modified := nil.
	[self compileMethodText: aText from: aController]
		ensure: [modified := false]