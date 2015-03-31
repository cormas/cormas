actions
applyUserChangeForStep: aNewStep
	"this method is call from Cormas when user have manually change the inputField current step"
	
	self enableBackward ifFalse: [^false].
	aNewStep < 0 ifTrue: [^false].
	self currentTime = aNewStep ifTrue: [^true].
	aNewStep = 0
		ifTrue: [self setButtonsForTime0]
		ifFalse: [self setButtonsForTime1].
	self currentTime < aNewStep ifTrue: [^self replayStepForward: aNewStep].
	self currentTime > aNewStep
		ifTrue:
			[buttonsForwardAreOn := false.
			^self restoreOrganizationAt: aNewStep].
	^false