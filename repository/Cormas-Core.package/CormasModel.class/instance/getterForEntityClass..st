accessing - entities
getterForEntityClass: aClass
	"efficiently create the getter selector for the entity class aClass (avoid concatenation).
	ex : Object -> #theObjects

	self basicNew getterForEntityClass: Object
	"
	
	^self class getterForEntityClass: aClass