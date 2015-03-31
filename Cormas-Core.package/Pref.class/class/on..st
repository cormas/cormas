initialize
on: anAgentObs
	
	| tmp |
	tmp := super new initialize.
	tmp privateAgent: anAgentObs.
	^tmp