actions
applyUserChangeForFinalStep: aNewFinalStep
	"this method is call from Cormas when user have manually change the inputField current step"
	
	aNewFinalStep < 0 ifTrue: [^false].
	self finalTime = aNewFinalStep ifTrue: [^true].
	self currentTime < aNewFinalStep
		ifTrue:
			[self simButtonAt: #run displayActivated: true.
			^true]
		ifFalse:
			[self simButtonAt: #run displayActivated: false.
			^false]