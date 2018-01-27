- initialize-release
destroyed: aBoolean
	
	destroyed := aBoolean.
	(aBoolean and: [self isSituated]) ifTrue: [self leave]