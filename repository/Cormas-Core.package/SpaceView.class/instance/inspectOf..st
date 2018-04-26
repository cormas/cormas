click
inspectOf: figure
	"method called from Tool (initializeChangeAttributeTool), to execute a of the attribute of a cell clicked by the user"
	
	figure model entity class = self manipulatedEntity ifFalse: [^nil].
	figure model entity inspect