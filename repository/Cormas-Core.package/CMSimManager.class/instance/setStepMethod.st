replay-forward
setStepMethod
	" Answer a <Boolean> "
	| resp |
	(self enableBackward isKindOf: Boolean)
		ifTrue: [ enableBackwardValue := self enableBackward asValue ].
	self listControle list: (self cormasModel class organization listAtCategoryNamed: #control).
	self listControle isEmpty
		ifTrue: [ 
			self alertMessage: 'The model does not define any method for control !'.
			^ false].
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl]
		ifFalse: [
			self listControle notEmpty
				ifTrue: [ self listControle selection: self listControle list first ] ].
	self finalStep value: self cormasModel finalTime.
	resp := self openDialogInterface: #changeStepInterface.
	resp ifFalse: [ ^ false ].
	self listControle selection isNil
		ifTrue: [ 
			self alertMessage: 'Please, select a method of #control'.
			^ self setStepMethod]
		ifFalse: [ self cormasModel activeControl: self listControle selection ].
	self cormas cycle value: self finalStep value.
	self enableBackward: self enableBackwardValue value.
	self keepOrReleaseRandomSeed.
	^ true