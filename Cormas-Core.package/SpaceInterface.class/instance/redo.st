undo/redo
redo
	"reload the last redo BOS File saved by the SimManager"
	
	self enableUndo ifFalse: [^nil].
	self cormasModel simManager redo