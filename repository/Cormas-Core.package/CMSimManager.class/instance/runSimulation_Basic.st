simulate
runSimulation_Basic
	"Run one simulation step by step.
	Do not display the Duration time on the Transcript.
	Method called from #runSimulation but also from SensitivityAnalysisAbstract #runOneSimulation"
	
	| continue |
	continue := true.
	[continue]
		whileTrue:
			[self currentSimEnded
				ifTrue: [continue := false]
				ifFalse: [self runStepByStep ifNil: [continue := false]]	" *********   One Step  ***********"	" *********     Done  ***********"]