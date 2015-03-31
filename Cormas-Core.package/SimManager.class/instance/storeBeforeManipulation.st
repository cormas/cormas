undo/redo
storeBeforeManipulation
	"Store the whole state of the current model as BOS file into the appropriate simFolder . This is done before manipulation from the user, in order to enable the Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	| filename |
	filename := self simFolder
		construct:
			self stepNameStart , self currentTime printString , '_'
				, (self undoList size + 1) printString , self class bosExtension.
	self undoList addLast: filename.
	self redoList isEmpty ifFalse: [redoList := nil].
	self cormasModel dumpOrganizationOnFile: filename