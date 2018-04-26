init
initWithProgrammableScenario

	self initCells: #initWith: withArguments: {percentageOfTrees}.
	1 to: numberOfFires do: [:i | self pickCell state: #fire].
	self initAgents.