+ diagram
performActivityDiagram
	"Purpose: to open the editor of activity diagrams. This method may be redefined"
	
	| aName |
	aName := self class chooseActivityDiagramName.
	aName ifNil: [^nil].
	self performActivityDiagram: aName