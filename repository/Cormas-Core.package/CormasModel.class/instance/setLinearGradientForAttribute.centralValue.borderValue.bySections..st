+ init - spatial entities
setLinearGradientForAttribute: anAttribute centralValue: cv borderValue: bv bySections: anArray
	"Purpose: Set the value of anAttribute of all spatial entity elements of the spatial grid in order to create a gradient by layers for anAttribute starting from centre of the spatial grid with the value cv to the border of the spatial grid with the value bv. The horizontal and vertical grid dimensions have to be an odd number.
Arguments: cv and bv are numbers (integer or float). anAttribute is the name of the attribute as symbol. 
anArray is an array made of two values arrays. The first value specifies the number of layers affected and the second value is a factor affecting the gradient for the concerned layer.
Example: self setLinearGradientForAttribute: #energy centralValue: 10 borderValue: 0.1 bySections: #( #(2 0.5) #(4 1) #(2 0.5))"
	
	^self spaceModel setLinearGradientForAttribute: anAttribute centralValue:
			cv borderValue: bv bySections: anArray