changed
changeFinalV
	"change Validation for the stepCounter input field"
	
	| newValue |
	newValue := self cycle myDependents hasEditValue
		ifTrue: [self cycle myDependents editValue]
		ifFalse: [^true].	"^true"
	^self simManager applyUserChangeForFinalStep: newValue