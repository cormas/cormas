accessing
isUndoRedoEnabled: aBoolean
	
	| menuDyn |
	isUndoRedoEnabled := aBoolean.
	builder
		ifNotNil:
			[:b | 
			menuDyn := (b menuAt: #displayOptionsMenu) value atNameKey: #toggleUndoRedo.
			aBoolean
				ifTrue: [menuDyn beOn]
				ifFalse: [menuDyn beOff]].
	self spaceInterface enableUndo = aBoolean
		ifFalse: [self spaceInterface enableUndoOption]