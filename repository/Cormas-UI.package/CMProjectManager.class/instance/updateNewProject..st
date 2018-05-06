callbacks
updateNewProject: modelName
	" See superimplementor's comment "

	self currentProject hasCormasModelClass
		ifFalse: [ self currentProject cormasModelClass: (self createClassModelNamed: modelName).
			self currentProject cormasModel: self cormasModelClass new ].
	self cormasModelClass initialize.
	self cormasModel projectManager: self.
	super updateNewProject: modelName.
	self cormasModel timeStep:0.