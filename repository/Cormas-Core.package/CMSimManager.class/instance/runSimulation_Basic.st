simulate
runSimulation_Basic
	"Run one simulation step by step.
	Do not display the Duration time on the Transcript.
	Method called from #runSimulation but also from SensitivityAnalysisAbstract #runOneSimulation"

	| continue |
	continue := true.
	[ continue ]
		whileTrue: [ self currentSimEnded
				ifTrue: [ continue := false ]
				ifFalse:
					[ " *********   One Step  ***********" " *********     Done  ***********" self runStepByStep ifNil: [ continue := false ] ] ].
	self flag: #shouldBeRevised
	"what is the need of having  'continue' temporary variable here ?
	why the method is not written as siply as    [self currentSimEnded] whileFalse: [ self runStepByStep ]"