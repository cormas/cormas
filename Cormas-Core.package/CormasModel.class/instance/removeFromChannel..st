initalize release
removeFromChannel: anAgent
	
	self channel listeFonctionObs
		do: [:a | a populationSourceRemoveAgent: anAgent]