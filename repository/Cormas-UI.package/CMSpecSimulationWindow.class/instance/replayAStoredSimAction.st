callbacks
replayAStoredSimAction
	" #openReplayWin "

	self halt.
	self application hasStoredSimulations
		ifFalse: [ self alertMessage: self translator tNoStoredSim ]
		ifTrue: [ self requestStoredSims: self application storedSimulations ]
