printing
printOn: aStream
	
	aStream
		nextPutAll: hostName;
		nextPut: $:;
		print: port;
		nextPutAll: ' - '.
	self habitusNames isEmpty
		ifTrue: [aStream nextPutAll: 'no habitus']
		ifFalse:
			[self habitusNames
				do: [:each | aStream nextPutAll: each]
				separatedBy: [aStream nextPut: $,]]