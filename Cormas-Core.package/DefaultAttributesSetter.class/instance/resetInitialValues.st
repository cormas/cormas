actions
resetInitialValues
	" Set a the initial values of the attributes to re-initialzise a simulation.
	Each attribute is set to nil then reader accessor is called that set the initialValue.
	Note that the default value accessors at class level are not redefined"
	
	self classAttribValue_List list
		do:
			[:defAttrib | 
			"Compatibility with previous Cormas version: before changing, it tests if the default class method exists otherwise compiles it"
			self resetInitialValue: defAttrib]