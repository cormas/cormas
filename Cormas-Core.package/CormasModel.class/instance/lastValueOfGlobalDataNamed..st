probes - recording
lastValueOfGlobalDataNamed: name
	
	(self data includesKey: self class name)
		ifTrue:
			[((self data at: self class name) includesKey: name)
				ifTrue: [^((self data at: self class name) at: name) last]
				ifFalse: [^0]]
		ifFalse: [^0]