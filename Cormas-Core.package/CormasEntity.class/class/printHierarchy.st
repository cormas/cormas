+ printing
printHierarchy
	"Purpose: to show the hierarchy of all the subclasses of the receiver
Return value: a byteString
Example: CormasNS.Kernel.Agent printHierarchy"
	
	| s |
	s := WriteStream on: (String new: 16).
	self printSubclassesOn: s level: 0.
	^s contents