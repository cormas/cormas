global variables
navigateToClass
	
	| binding |
	binding := self selectedVariableBinding.
	binding ifNil: [^self].
	(self updateRequest and: [self changeRequest]) ifFalse: [^self].
	codeModel setBinding: binding