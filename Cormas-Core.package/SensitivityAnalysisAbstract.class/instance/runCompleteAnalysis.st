simulation
runCompleteAnalysis
	"Run a complete analysis, running X times [#initNextSimulation & #runOneSimulation]"
	
	isAnalysisEnded := false.
	Processor yield.
	process isNil
		ifFalse:
			[process suspendedContext isNil
				ifFalse:
					[process suspendingList isNil
						ifFalse:
							[self simRunButton_Pause: false.
							^process suspend]
						ifTrue:
							[self simRunButton_Pause: true.
							^process resume]]].	"*******************************************************************"	"**********************     RUN  threaded    *********************"
	process := [self runCompleteAnalysis_basic]
		forkAt: Processor userBackgroundPriority.	"  ********************       END LOOP        ********************"	"*******************************************************************"	"The instructions below are, normaly, not called, because #terminate (called on process) will leave this current method"
	self isAnalysisEnded
		ifTrue:
			[process isNil
				ifFalse:
					[process terminate.
					process := nil]]