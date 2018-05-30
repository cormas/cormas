accessing
getGlobalData
	"Return a dictionary of the global probes"

	(self data includesKey: self class name)
		ifTrue: [ ^ self data at: self class name ]
		ifFalse: [ ^ Dictionary new ]