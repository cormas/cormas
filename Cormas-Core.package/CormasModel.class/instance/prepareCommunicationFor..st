initalize release
prepareCommunicationFor: anAgent
	
	anAgent channel: self channel.
	self channel population add: anAgent.
	self channel listeFonctionObs
		do: [:a | a populationSourceAddAgent: anAgent]