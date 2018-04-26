callbacks
openProject: modelName fileName: fileName
	" Open the project named projectApp "

	| modelClass |
	modelClass := (self findModelClass: fileName) allButFirst asClass.
	self currentProject: (CMProjectModel basicNew
		fileName: fileName;
		initializeForModel: modelClass new named: modelName;
		yourself).

