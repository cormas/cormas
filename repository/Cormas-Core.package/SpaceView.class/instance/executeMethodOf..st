click
executeMethodOf: figure
	"method called from Tool (initializeChangeAttributeTool), to execute a of the attribute of a cell clicked by the user"
	
	(figure model entity class includesBehavior: self manipulatedEntity)
		ifFalse: [^nil].
	model storeBeforeManipulation.
	figure model entity
		perform: self manipulationAction asSymbol
		withArguments: self manipulationActionArguments