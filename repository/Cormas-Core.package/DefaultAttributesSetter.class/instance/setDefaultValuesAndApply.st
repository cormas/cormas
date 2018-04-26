actions
setDefaultValuesAndApply
	" set a the default values of the attributes when user have clicked on 'Back to Default Values'.
	The attributes of the existing objects are associated to the default values and the attributes accessors are redefined using the default value accessors at class level"
	
	| list |
	list := self classAttribValue_List list.	"(list select: [:defAttrib | defAttrib hasBeenModified])
		do: [:defAttrib | self setDefaultValue: defAttrib]."
	list do: [:defAttrib | self setDefaultValue: defAttrib].	"pour plus de s√©curit√©..."
	self classAttribValue_List list: list