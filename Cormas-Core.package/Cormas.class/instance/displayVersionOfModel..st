version
displayVersionOfModel: aModel
	"Display the model version on Cormas GU interface"
	
	aModel version isNil ifTrue: [aModel setVersion: 'v-0'].	"self mainWin label: self mainWin label, '  version: ', aModel version."
	self modelNameField value: self modelName.
	self versionField value: aModel version