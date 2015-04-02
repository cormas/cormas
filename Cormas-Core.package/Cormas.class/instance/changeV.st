changed
changeV
	"change Validation for the stepCounter input field"
	
	| newValue |
	newValue := self stepCounter myDependents hasEditValue
		ifTrue: [self stepCounter myDependents editValue]
		ifFalse: [^true].	"^true"
	self cormasModel ifNil: [^true].
	^self simManager applyUserChangeForStep: newValue