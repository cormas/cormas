actions
pingServer
	
	| ok |
	self brokerStarted ifFalse: [^Dialog warn: 'A broker should be started'].
	self
		updateStatus: #pingServerStatus
		toColor: ColorValue gray
		immediate: true.
	ok := broker ping: self serverIP.
	self
		updateStatus: #pingServerStatus
		toColor: (self statusColorFor: ok)
		immediate: true