actions
actionOpenPreferences
	
	dialogPreferences := SimpleDialog new.
	dBuilder := dialogPreferences builder.
	dialogPreferences openFor: self interface: #ecranPreferences