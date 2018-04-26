actions_menu
saveCurrentSettings
	"Compiles a new method #hiddenAttributes of CormasModel that returns a list of hidden attributes that won't be displayed by the parameter interface"
	
	(Dialog
		confirm:
			'Do you want to save these settings ?
Thus, the hidden parameters will be saved in '
				, self cormasModel class name , '.')
		ifTrue: [self compileHiddenAttributesMethod]