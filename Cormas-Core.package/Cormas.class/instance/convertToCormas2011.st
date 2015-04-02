version
convertToCormas2011
	"Add tje _default parameters to the entity classes of the model"
	
	| das |
	das := DefaultAttributesSetter new.
	das cormasModel: self cormasModel.
	das getDefaultParametersValues.
	self cormasModelClass testTheAccessors