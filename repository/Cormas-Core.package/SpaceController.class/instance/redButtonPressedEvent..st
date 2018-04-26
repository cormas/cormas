events
redButtonPressedEvent: anEvent
	"Click droit"
	
	[self sensor redButtonPressed]
		whileTrue:
			["	self sensor redButtonPressed ifTrue: "
			self sensor shiftDown
				ifTrue:
					[self sensor ctrlDown
						ifTrue:
							[self view performShiftCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performShiftRedButton: self sensor cursorPoint]]
				ifFalse:
					[self sensor ctrlDown
						ifTrue: [self view performCtrlRedButton: self sensor cursorPoint]
						ifFalse: [self view performRedButton: self sensor cursorPoint]]].
	self sensor waitNoButton