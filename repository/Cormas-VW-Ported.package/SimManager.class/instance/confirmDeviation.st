replay-forward
confirmDeviation
	"check if bos file for next step exists. If not, then continue to simulate and to save into the same folder (continue the same simulation process).
	If exists, then proposes to save the sim history (from 0 to currentStep) into a new folder"
	
	| finename resp |
	finename := self simFolder
		construct: (self stepFileNameAtStep: self currentTime + 1).
	finename exists
		ifTrue:
			[self class
				newFolder:
					((Cormas dumpPath: self cormasModel class name) construct: self newSimName).
			resp := self openNewDeviationWin.
			resp
				ifTrue:
					[self simNumero: self simNumero + 1.
					self enableBackward
						ifTrue:
							[self copyPreviousBackStepsInNewFolder.
							self traceSize: self currentTime]
						ifFalse: [self traceSize: 0]].
			^resp]
		ifFalse: [^true]