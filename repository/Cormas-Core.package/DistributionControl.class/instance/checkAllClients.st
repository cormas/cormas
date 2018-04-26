actions
checkAllClients
	
	| notResponding |
	notResponding := Set new.
	self clients list
		do:
			[:c | (self ping: c distributionControl) ifFalse: [notResponding add: c]].
	notResponding isEmpty
		ifFalse:
			[notResponding do: [:c | self removeClient: c].
			self spaceModel checkRemoteSpaceModels]