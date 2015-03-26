initialize-release
initialize
	
	super initialize.
	self brokerNameOrIP value: self class getHostname.
	self brokerPort value: self class defaultPort printString.
	self serverNameOrIP value: self class getHostname.
	self serverPort value: self class defaultPort printString.
	self distributedMode onChangeSend: #distributedModeChange to: self.
	self clients selectionIndexHolder onChangeSend: #clientsSelectionChanged
		to: self.
	self updateHabitusNames