programmable scenario
initWithProgrammableScenario

	self initCells: #initWith: withArguments: {percentageOfTrees}.
	1 to: self numberOfFires do: [:i | self pickCell state: #fire].
	self initAgents.