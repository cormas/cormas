+ utilities - classes
modelClass
	"Purpose: returns the Class of the current model.
Return value: <class>
Example: RestrainedForager modelClass -> ECEC "
	
	^self package classes detect:[:cl| cl superclass = CormasModel] ifNone:[nil]