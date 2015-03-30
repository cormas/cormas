initialize-release
delete
	
	self outgoing do: [:destination | destination removeIncoming: self].
	self incoming do: [:origine | origine removeOutgoing: self].
	outgoing := nil.
	incoming := nil