simulation
runCompleteAnalysis_basic
	"Run a complete analysis, running X times [#initNextSimulation & #runOneSimulation]"
	
	| nbSims continue chrono |
	chrono := Time
		millisecondsToRun:
			[nbSims := 1 max: self totalSimNumberWithRepeat.
			continue := true.
			[continue]
				whileTrue:
					[self initNextSimulation isNil
						ifTrue:
							[continue := false.
							self endAnalysis]
						ifFalse:
							[self keepOrReleaseRandomSeed.
							self runOneSimulation.
							self saveData.
							self analysisProgress value: self simNumero / nbSims]]].
	self displayAnalysisDuration: chrono.
	process terminate.
	process := nil