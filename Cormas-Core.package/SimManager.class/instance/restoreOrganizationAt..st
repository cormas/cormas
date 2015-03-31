replay-store/restore
restoreOrganizationAt: aStep
	"Restore the stored model state at aStep"
	
	| finename |
	finename := self simFolder construct: (self stepFileNameAtStep: aStep).
	finename exists
		ifFalse:
			[Dialog
				warn:
					'Sorry, there is no bos file at time ' , aStep printString ,
							'
for simulation ' , self simName.
			^false].
	self buttonsForwardAreOn
		ifFalse:
			[self simButtonAt: #replayRunForward displayActivated: true.
			self simButtonAt: #replayStepForward displayActivated: true.
			self simButtonAt: #run displayActivated: true.
			buttonsForwardAreOn := true].
	^self cormasModel restoreOrganizationFromFile: finename