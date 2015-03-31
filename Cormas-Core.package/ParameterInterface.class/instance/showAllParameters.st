actions_menu
showAllParameters
	"Display all the attributes (including hiddenAttributes) of the model on the parameter interface"
	
	self allAttributsList do: [:cav | cav isHidden: false].
	self initFull