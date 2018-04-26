accessing
totalSimNumber
	"return the number of simulations for the analysis, Without multiplying by the repeat number for each parameters set."
	
	| tot |
	tot := 1.
	self parametersToAnalyse do: [:cav | tot := tot * cav nbOfSims].
	^tot