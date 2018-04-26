replay-forward
replayStepForward: newStep
	"Replay a newStep forward using BOS file"
	
	| filename resp |
	(filename := self simFolder / (self stepFileNameAtStep: newStep)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false.
			self alertMessage: 'Sorry, there is no bos file at time ' , newStep printString ,
							'
for simulation ' , self simName.
			^ false].
	undoList := nil.
	redoList := nil.
	resp := self cormasModel restoreOrganizationFromFile: filename.
	(filename := self simFolder / (self stepFileNameAtStep: newStep + 1)) exists
		ifFalse: [
			self simButtonAt: #replayRunForward displayActivated: false.
			self simButtonAt: #replayStepForward displayActivated: false.
			buttonsForwardAreOn := false ].
	^ resp