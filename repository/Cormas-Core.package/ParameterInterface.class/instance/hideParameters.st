actions_menu
hideParameters
	"open a new interface that enables user to select the parameters to be hidden"
	
	hiddenParametersInterface := ParameterInterface new.
	hiddenParametersInterface cormasModel: self cormasModel.
	hiddenParametersInterface classAttribValue_List
		list: self allAttributesList copy.
	hiddenParametersInterface openInterface: #hiddenParametersWindow.
	hiddenParametersInterface hiddenParametersInterface: self