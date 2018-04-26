initialize-release
init
	
	super init.	"self finalStep value > 0
		ifFalse:
			[self cormas cycle value > 0
				ifTrue: [self finalStep value: self cormas cycle value]]."
	self listControle
		list: (self cormasModelClass organization listAtCategoryNamed: #control).
	self cormasModel activeControl notNil
		ifTrue: [self listControle selection: self cormasModel activeControl].
	self listInit
		list: (self cormasModelClass organization listAtCategoryNamed: #init).
	self cormasModel activeInit notNil
		ifTrue: [self listInit selection: self cormasModel activeInit].
	listInit selectionIndexHolder onChangeSend: #changedInitMethod to: self.
	listControle selectionIndexHolder onChangeSend: #changedStepMethod to:
			self