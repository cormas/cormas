version
setModelVersionEqualTo: aFileName
	
	| versionAsString |
	versionAsString := aFileName isString
		ifTrue: [aFileName]
		ifFalse: [aFileName tail].
	self cormasModelClass setVersion: versionAsString