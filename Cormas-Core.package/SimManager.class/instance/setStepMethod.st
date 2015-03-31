replay-forward
setStepMethod
	
	| resp |
	(self enableBackward isKindOf: Boolean)
		ifTrue: [enableBackwardValue := self enableBackward asValue].
	self listControle
		list: (self cormasModel class organization listAtCategoryNamed: #control).
	self listControle list size = 0
		ifTrue:
			[Dialog warn: 'The model does not define any method for control !'.
			^false].
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl]
		ifFalse:
			[self listControle list size >= 1
				ifTrue: [self listControle selection: self listControle list first]].
	self finalStep value: self cormasModel finalTime.
	resp := self openDialogInterface: #changeStepInterface.
	resp ifFalse: [^false].
	self listControle selection isNil
		ifTrue:
			[Dialog warn: 'Please, select a method of #control'.
			^self setStepMethod]
		ifFalse: [self cormasModel activeControl: self listControle selection].
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.
	self keepOrReleaseRandomSeed.
	^true