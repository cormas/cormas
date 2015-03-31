menu - actions
clicToChange
	
	self activeSpatialEntity notNil
		ifTrue:
			[self drawing clicToChange.
			self activateInspectTool.
			Cursor caret beCursor]