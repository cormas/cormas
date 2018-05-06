callbacks
openImageProject: modelName
	" Open the project named projectApp "
	| modelClass |
	modelClass := ('CM',modelName , 'Model') asClass.
	self currentProject: (CMProjectModel basicNew
		initializeForModel: modelClass new named: modelName;
		yourself).

