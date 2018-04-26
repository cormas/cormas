click
changeAttributeOf: figure
	"method called from Tool (initializeChangeAttributeTool), to set a new value of the attribute of a cell clicked by the user"
	
	(figure model entity perform: activeAttribute asSymbol) =
			activeAttributeValue ifFalse: [model storeBeforeManipulation].
	figure model entity
		perform: (activeAttribute , ':') asSymbol
		with: activeAttributeValue