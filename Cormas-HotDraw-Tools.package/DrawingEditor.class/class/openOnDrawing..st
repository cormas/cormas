interface opening
openOnDrawing: aDrawing
	
	| editor |
	editor := self new.
	editor drawing: aDrawing.
	editor open