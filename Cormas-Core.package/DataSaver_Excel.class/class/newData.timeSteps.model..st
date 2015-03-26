new
newData: aDicoOfData timeSteps: aCollOfTimeSteps model: cormasModel
	
	| inst |
	inst := super newData: aDicoOfData timeSteps: aCollOfTimeSteps model:
			cormasModel.
	inst ifNil: [^nil].
	inst createExcelConnexion.
	^inst