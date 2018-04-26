callbacks
updateNewProject: modelName
	" See superimplementor's comment "
	
	self currentProject hasCormasModelClass 
		ifFalse: [ 
			self currentProject cormasModelClass: (self createClassModelNamed: modelName).
			self currentProject cormasModel: self cormasModelClass new ].
	self cormasModelClass initialize.
	super updateNewProject: modelName.
	