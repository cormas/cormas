probes - recording
updateGlobalData
	
	(self data includesKey: self class name)
		ifTrue:
			[(self data at: self class name)
				keysAndValuesDo: [:name :list | list add: (self perform: name)]]