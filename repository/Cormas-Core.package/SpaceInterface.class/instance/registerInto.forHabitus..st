updating
registerInto: aCollection forHabitus: habitusName
	"register the receiver into aCollection if it has the habitusName
	always registrer if habitusName is nil"
	
	(habitusName isNil or: [self isForHabitus: habitusName])
		ifTrue: [aCollection add: self]