+ printing
cmPrintHierarchy
	"Purpose: to show the hierarchy of all the subclasses of the receiver
	Return value: a byteString"

	"CMAgent cmPrintHierarchy"

	^ String streamContents: [ :stream | self printSubclassesOn: stream level: 0 ]