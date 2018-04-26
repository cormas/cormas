accessing
getAgentSuperclassFromGUI
	
	self cbComm value not & self cbLocation value not & self cbGroup value not
		ifTrue: [^Agent].
	self cbComm value & self cbLocation value not & self cbGroup value not
		ifTrue: [^AgentComm].
	self cbComm value not & self cbLocation value & self cbGroup value not
		ifTrue: [^AgentLocation].
	self cbComm value & self cbLocation value & self cbGroup value not
		ifTrue: [^CMAgentCommLocation].
	self cbComm value not & self cbLocation value not & self cbGroup value
		ifTrue: [^CMGroup].
	self cbComm value & self cbLocation value not & self cbGroup value
		ifTrue: [^CMGroupComm].
	self cbComm value not & self cbLocation value & self cbGroup value
		ifTrue: [^CMGroupLocation].
	self cbComm value & self cbLocation value & self cbGroup value
		ifTrue: [^CMGroupCommLocation]