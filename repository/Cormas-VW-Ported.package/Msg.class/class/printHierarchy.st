printing
printHierarchy
	"Answer a description containing the names of all of the subclasses and superclasses of the receiver."
	
	| s |
	s := WriteStream on: (String new: 16).
	self printSubclassesOn: s level: 0.
	^s contents