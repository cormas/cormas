simulation
runOneSimulation_Basic
	"Run one simulation step by step.
	Do not display the Duration time on the Transcript.
	Method called from #runSimulation but also from SensitivityAnalysisAbstract #runOneSimulation"
	
	| continue |
	self simProgress value: 0.
	continue := true.
	[continue]
		whileTrue:
			[self simManager currentSimEnded
				ifTrue: [continue := false]
				ifFalse:
					[self cormasModel runStep ifNil: [continue := false].
					self simProgress
						value: self cormasModel timeStep / self finalStep value]	" *********   One Step  ***********"	" *********     Done  ***********"]