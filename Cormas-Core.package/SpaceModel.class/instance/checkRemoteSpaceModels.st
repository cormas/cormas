private - notification
checkRemoteSpaceModels
	
	| notResponding |
	notResponding := Set new.
	self myDependents
		do: [:c | (self ping: c) ifFalse: [notResponding add: c]].
	notResponding do: [:c | self removeDependent: c]