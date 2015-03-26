accessing - entities
setterForEntityClass: aClass
	"Return a Symbol as a name for the setter accessor for the entity class aClass.
	ex : Object -> #theObjects: 

	self basicNew setterForEntityClass: Object
	"
	
	^self class setterForEntityClass: aClass