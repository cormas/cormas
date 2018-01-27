initialize-release
prepareSettings
	
	self
		entitiesList:
			(self spaceInterface cormasModelClass visualizableClasses
				sort: [:x :y | x name < y name]) asList.
	self observedEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self manipEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self createEntitiesList
		setList: self entitiesList copy
		selecting: nil.
	self manipEntitiesList selectionHolder onChangeSend:
			#displayMethodsAndOptionsForManipEntity to: self.
	self observedEntitiesList selectionHolder onChangeSend:
			#displayMethodsForObservedEntity to: self