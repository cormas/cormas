undo/redo
enableUndoOption
	"Enable (desable) redo, and display (hide) the Redo/Undo buttons"
	
	self enableUndo: self enableUndo not.
	self enableUndo
		ifTrue:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOn.
			(self builder componentAt: #undoButton)
				beVisible;
				enable.
			(self builder componentAt: #redoButton)
				beVisible;
				enable]
		ifFalse:
			[((self menuHolder value atNameKey: #option) submenu atNameKey:
					#enableUndoOption) beOff.
			(self builder componentAt: #undoButton) beInvisible.
			(self builder componentAt: #redoButton) beInvisible]