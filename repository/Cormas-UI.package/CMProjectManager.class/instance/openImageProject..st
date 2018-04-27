callbacks
openImageProject: modelName
	" Open the project named projectApp "

	self currentProject: (CMProjectModel basicNew
		initializeForModel: (Smalltalk at: modelName asSymbol) named: modelName;
		yourself).

