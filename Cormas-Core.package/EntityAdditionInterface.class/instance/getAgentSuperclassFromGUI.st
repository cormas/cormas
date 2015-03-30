accessing
getAgentSuperclassFromGUI
	
	self cbComm value not & self cbLocation value not & self cbGroup value not
		ifTrue: [^Agent].
	self cbComm value & self cbLocation value not & self cbGroup value not
		ifTrue: [^AgentComm].
	self cbComm value not & self cbLocation value & self cbGroup value not
		ifTrue: [^AgentLocation].
	self cbComm value & self cbLocation value & self cbGroup value not
		ifTrue: [^AgentCommLocation].
	self cbComm value not & self cbLocation value not & self cbGroup value
		ifTrue: [^CormasGroup].
	self cbComm value & self cbLocation value not & self cbGroup value
		ifTrue: [^GroupComm].
	self cbComm value not & self cbLocation value & self cbGroup value
		ifTrue: [^GroupLocation].
	self cbComm value & self cbLocation value & self cbGroup value
		ifTrue: [^GroupCommLocation]