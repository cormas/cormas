initialize-release
resetParameters
	"reset the parameters of the classes of the model to nil, then calls the attribut reader accessors to set the default value"
	
	self parametersForReInitialization
		do: [:cav | cav setAttributeInitialValue]