+ init - spatial entities
setLinearGradientForAttribute: aString centralValue: cv borderValue: bv
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a linear gradient for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1"
	
	^self spaceModel setLinearGradientForAttribute: aString centralValue: cv
		borderValue: bv