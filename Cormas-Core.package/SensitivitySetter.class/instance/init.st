initialize-release
init
	
	super init.
	self stepMethodChoices
		value: (self cormasModelClass organization listAtCategoryNamed: #control).
	self cormasModel activeControl notNil
		ifTrue: [self stepMethod value: self cormasModel activeControl].
	self initMethodChoices
		value: (self cormasModelClass organization listAtCategoryNamed: #init).
	self cormasModel activeInit notNil
		ifTrue: [self initMethod value: self cormasModel activeInit].
	self initMethod.
	initMethod onChangeSend: #changedInitMethod to: self.
	self stepMethod.
	stepMethod onChangeSend: #changedStepMethod to: self