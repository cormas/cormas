replay-forward
replayStepForward: newStep
	"Replay a newStep forward using BOS file"
	
	| finename resp |
	finename := self simFolder construct: (self stepFileNameAtStep: newStep).
	finename exists
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false.
			Dialog
				warn:
					'Sorry, there is no bos file at time ' , newStep printString ,
							'
for simulation ' , self simName.
			^false].
	undoList := nil.
	redoList := nil.
	resp := self cormasModel restoreOrganizationFromFile: finename.
	finename := self simFolder
		construct: (self stepFileNameAtStep: newStep + 1).
	finename exists
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false].
	^resp