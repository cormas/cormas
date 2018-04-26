actions
getAgentSuperclassFromGUI
	
	self cbComm state not & self cbLocation state not & self cbGroup state not
		ifTrue: [ ^ CMAgent ].
	self cbComm state & self cbLocation state not & self cbGroup state not
		ifTrue: [ ^ CMAgentComm ].
	self cbComm state not & self cbLocation state & self cbGroup state not
		ifTrue: [ ^ CMAgentLocation ].
	self cbComm state & self cbLocation state & self cbGroup state not
		ifTrue: [ ^ CMAgentCommLocation ].
	self cbComm state not & self cbLocation state not & self cbGroup state
		ifTrue: [ ^ CMGroup ].
	self cbComm state & self cbLocation state not & self cbGroup state
		ifTrue: [ ^ CMGroupComm ].
	self cbComm state not & self cbLocation state & self cbGroup state
		ifTrue: [ ^ CMGroupLocation ].
	self cbComm state & self cbLocation state & self cbGroup state
		ifTrue: [ ^ CMGroupCommLocation ]