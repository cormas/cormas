simulate
runStepByStep
	
	self buttonsForwardAreOn ifTrue: [buttonsForwardAreOn := false].
	undoList := nil.
	redoList := nil.
	self enableBackward
		ifTrue:
			[self confirmDeviation
				ifFalse: [^nil]
				ifTrue:
					[self cormasModel activeControl isNil
						ifTrue: [self setStepMethod ifFalse: [^nil]]]]
		ifFalse:
			[self cormasModel activeControl isNil
				ifTrue: [^self cormas alert_NoDynamic]].	"  **********   RUN Step   ********"
	self cormasModel runStep.	"  **********    Done   ********"
	self enableBackward ifTrue: [self storeCurrentStep]