undo/redo
storeBeforeManipulation
	"Store the whole state of the current model as BOS file. This is done before manipulation from the user, in order to enable Undo.
The #storeBeforeManipulation is called when the manipulation tool is activated, for 
 - the moving of a figure (Figure isMovedTo: point)
 - the Manipulate Menu on a figure (SpaceController #processManipulateMenuAt:local:forSelectedFigures:localFigures:)
 - and for the Creation Tool (Tool initializeCreateEntityTool)"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager storeBeforeManipulation