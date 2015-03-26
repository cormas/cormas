testing
hasInstanceVariableSelected
	
	^super hasInstanceVariableSelected
		and: [self hasTemporaryVariableSelected not]