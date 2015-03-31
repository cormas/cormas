replay-forward
openNewDeviationWin
	
	| resp |
	(self openDialogInterface: #windowNewDeviation) ifFalse: [^false].
	resp := self deviationChoice value.
	resp = #noDeviation.
	resp = #deviationRandom ifTrue: [Cormas initRandomSeed].
	resp = #newDeviation
		ifTrue:
			[releaseRandomSeed value: true.
			^self setStepMethod].
	^true