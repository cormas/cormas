updating
update: aSymbol with: aValue
	"propagate time changes to the dependents"
	
	aSymbol == #timeChanged ifTrue: [self changed: aSymbol with: aValue].
	super update: aSymbol with: aValue