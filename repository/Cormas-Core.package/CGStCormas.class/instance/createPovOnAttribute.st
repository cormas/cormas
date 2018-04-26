mustache-templates
createPovOnAttribute
	" Generate code String for #initializeWidgets "

	^ (MustacheTemplate on: self templateForPovOnAttribute) value: self buildContext.