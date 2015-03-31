undo/redo
undo
	"reload the last undo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager undo