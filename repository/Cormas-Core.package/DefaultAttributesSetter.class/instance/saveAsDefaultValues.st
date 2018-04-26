actions
saveAsDefaultValues
	"Save definitively the changed parameters with the Initial value: compiles the attribute reader accessor and compiles the attribute_default method"
	
	| listCAVs |
	listCAVs := self classAttribValue_List list
		select: [:defAttrib | defAttrib hasBeenModified].
	listCAVs isEmpty ifTrue: [^nil].
	self confirmSaveDefaultValues ifFalse: [^nil].
	listCAVs
		do:
			[:aCAV | 
			aCAV compileDefaultValue isNil ifFalse: [aCAV setAttributeNewValue].
			aCAV hasBeenModified: false]