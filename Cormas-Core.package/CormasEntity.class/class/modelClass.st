as yet unclassified
modelClass
"Purpose: returns the Class of the current model.
Return value: <class>
Example: RestrainedForager modelClass -> ECEC "
	^modelClass ifNil: [self environment at: (self environment name) ifAbsent: nil]