manipulate instances
openedEntityInspectors_IsTheOnlyOne
	"Purpose: return an association which key is collection of opened entity inspectors for that space interface, and value is true or false depending if the enity inspecor is set to bethe only one.	"
	
	| result |
	result := OrderedCollection new -> false.
	self myDependents update: #openedEntityInspectors_IsTheOnlyOne with:
			result from: self.
	^result