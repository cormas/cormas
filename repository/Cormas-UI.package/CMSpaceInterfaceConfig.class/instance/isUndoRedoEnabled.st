accessing
isUndoRedoEnabled
	
	^isUndoRedoEnabled
		ifNil:
			[isUndoRedoEnabled := ((builder menuAt: #displayOptionsMenu) value
				atNameKey: #toggleUndoRedo) isOn]