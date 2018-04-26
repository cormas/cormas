+ diagram
performActivityDiagram
	"Purpose: Open an activity diagram chooser, then executes the target diagram. 
This method may be redefined"
	
	| aName |
	aName := self class chooseActivityDiagramName.
	aName ifNil: [^nil].
	self performActivityDiagram: aName