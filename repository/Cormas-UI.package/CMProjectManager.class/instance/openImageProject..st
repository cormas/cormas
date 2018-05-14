callbacks
openImageProject: modelName
	" Open the project of the modelClass "

	self
		currentProject:
			(CMProjectModel basicNew
				initializeForModel: modelName asClass new named: modelName;
				yourself)